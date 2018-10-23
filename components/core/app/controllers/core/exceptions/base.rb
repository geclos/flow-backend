module Core
  module Exceptions
    class Base < StandardError

      def initialize(errors = nil)
        @errors = errors
      end

      # Body of the exception
      #
      # @return [Hash]
      def body
        JSON.generate(errors: @errors)
      end
    end
  end
end
