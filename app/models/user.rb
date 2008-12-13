class User
  include DataMapper::Resource

  property :id, Serial
  property :login, String
  timestamps :at

  has n, :reports
end
