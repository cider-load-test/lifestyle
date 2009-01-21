# dependencies are generated using a strict version, don't forget to edit the dependency versions when upgrading.
merb_gems_version = "1.0.6.1"
dm_gems_version   = "0.9.8"

dependency "merb-action-args", merb_gems_version
dependency "merb-assets", merb_gems_version
dependency "merb-cache", merb_gems_version
dependency "merb-helpers", merb_gems_version
dependency "merb-slices", merb_gems_version
dependency "merb-auth-core", merb_gems_version
dependency "merb-auth-more", merb_gems_version
dependency "merb-auth-slice-password", merb_gems_version
dependency "merb-param-protection", merb_gems_version
dependency "merb-exceptions", merb_gems_version

#dependency "nokogiri", "1.1.0"

dependency "dm-core", dm_gems_version
dependency "dm-aggregates", dm_gems_version
dependency "dm-migrations", dm_gems_version
dependency "dm-types", dm_gems_version
dependency "dm-validations", dm_gems_version
dependency "dm-serializer", dm_gems_version
dependency "do_sqlite3", "0.9.9"

dependency "thoughtbot-factory_girl", "1.1.5", :require_as => false
