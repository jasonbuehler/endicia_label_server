require 'ox'

module EndiciaLabelServer
  module Builders
    class BuyPostageBuilder < BuilderBase
      include Ox

      # Initializes a new {RateBuilder} object
      #
      def initialize(opts = {})
        super 'RecreditRequest', opts
      end

      def post_field
        'RecreditRequestXML'
      end
    end
  end
end
