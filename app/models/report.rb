class Report
  include DataMapper::Resource

  property :id, Serial
  property :day, Integer
  property :created_at, DateTime, :nullable => false, :auto_validation => false
  property :updated_at, DateTime, :nullable => false, :auto_validation => false

  belongs_to :user
  has n, :items

  # Validate that it belongs to a user
  # TODO: Validate that it's a valid user?
  validates_with_block :user do
    if @user_id
      if User.get(@user_id).valid?
        true
      else
        [false, "Must belong to a valid user"]
      end
    else
      [false, "Must belong to a valid user"]
    end
  end

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
