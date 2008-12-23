class User
  include DataMapper::Resource

  property :id, Serial
  property :login, String
  property :created_at, DateTime, :nullable => false, :auto_validation => false
  property :updated_at, DateTime, :nullable => false, :auto_validation => false

  has n, :reports

  before :create, :set_timestamps
  before :update, :set_timestamps

  private
    def set_timestamps
      if self.new_record?
        self.created_at = DateTime.now
      end
      self.updated_at = DateTime.now
    end

end
