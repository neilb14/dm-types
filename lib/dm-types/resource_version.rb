require 'dm-core'

module DataMapper
  class Property
    class Version < Integer
      def initialize(model, name, options = {})
        options[:default] = 0
        super
      end

      def dump(value)
        value+1
      end
    end
  end
end 