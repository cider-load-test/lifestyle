class User
  include DataMapper::Resource

  property :id, Serial
  property :login, String
  property :created_at, DateTime, :nullable => false, :auto_validation => false
  property :updated_at, DateTime, :nullable => false, :auto_validation => false

  has n, :reports
  has n, :metrics

  validates_is_unique :login

  before :create, :set_timestamps
  before :update, :set_timestamps

  # This is nasty and fragile, but hides our crypted_password and salt when
  # displayed in data formats.
  [:xml, :json, :yaml].each do |f|
    self.class_eval do
      o = "to_#{f.to_s}_old".to_sym
      n = "to_#{f.to_s}".to_sym
      alias_method o, n
      define_method(n) do |opts|
        opts ||= {}
        self.send(o, opts.merge({:exclude => [:crypted_password, :salt]}))
      end
    end
  end

  private
    def set_timestamps
      if self.new_record?
        self.created_at = DateTime.now
      end
      self.updated_at = DateTime.now
    end

end
