module Merb
  module GlobalHelpers

    def id(object, att=nil)
      att = att ? "_" + att.to_s : ""
      # TODO: really need to underscore classname
      "#{object.class.to_s.downcase}_#{object.id}" + att
    end

    def jq(&block)
      if block_given?
        throw_content(:for_jq, &block)
      else
        catch_content(:for_jq)
      end
    end

    def title(string=nil, &block)
      if block_given?
        throw_content(:for_title, &block)
      else
        throw_content(:for_title, string)
      end
    end

    # TODO: flash helper

  end
end
