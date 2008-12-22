class User
  include DataMapper::Resource

  property :id, Serial
  property :login, String
  property :created_at, DateTime, :nullable => false
  property :updated_at, DateTime, :nullable => false

  has n, :reports

  private
    def set_timestamps
      if self.new_record?
        self.created_at = DateTime.now
      end
      self.updated_at = DateTime.now
    end

end
