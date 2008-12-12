class User
  include DataMapper::Resource
  
  property :id, Serial
  property :login, String

  timestamps :on

end
