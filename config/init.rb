# Go to http://wiki.merbivore.com/pages/init-rb
 
require 'config/dependencies.rb'
 
use_orm :datamapper
use_test :rspec
use_template_engine :erb
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'

  # cookie session store configuration
  c[:session_secret_key]  = '40e16e4e044c8e2520c322946ca83c91b868aaf7'
  c[:session_id_key] = '_lifestyle_session_id'
end
 
Merb::BootLoader.before_app_loads do
  Date.add_format(:pretty, "%A %B %d at %I:%M %p")
end
 
Merb::BootLoader.after_app_loads do
  # Redefine these attributes from the SaltedUser mixin to get laziness
  # At some point I should really just reimpliment that junk and
  # optimize it for OpenID and such. This is too hackish :\
  User.class_eval do
    property :crypted_password, String, :lazy => true
    property :salt, String, :lazy => true
  end
end
