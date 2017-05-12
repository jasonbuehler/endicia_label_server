module EndiciaLabelServer
  module Parsers
    class BuyPostageParser < ParserBase
      attr_accessor :requester_id, :request_id, :token

      def value(value)
        super

        string_value = value.as_s
        if switch_active? :RequesterID
          self.requester_id = string_value
        elsif switch_active? :RequestID
          self.request_id = string_value
        elsif switch_active? :Token
          self.token = string_value
        end
      end
    end
  end
end
