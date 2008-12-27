module Merb
  module GlobalHelpers

    def id(object, att=nil)
      att = att ? "_" + att.to_s : ""
      # TODO: really need to underscore classname
      "#{object.class.to_s.downcase}_#{object.id}" + att
    end
  end
end
