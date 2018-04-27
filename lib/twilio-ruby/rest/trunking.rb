##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Trunking < Domain
      ##
      # Initialize the Trunking Domain
      def initialize(twilio)
        super

        @base_url = 'https://trunking.twilio.com'
        @host = 'trunking.twilio.com'
        @port = 443

        # Versions
        @v1 = nil
      end

      ##
      # Version v1 of trunking
      def v1
        @v1 ||= V1.new self
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies the SIP Trunk
      #   in Twilio.
      # @return [Twilio::REST::Trunking::V1::TrunkInstance] if sid was passed.
      # @return [Twilio::REST::Trunking::V1::TrunkList]
      def trunks(sid=:unset)
        self.v1.trunks(sid)
      end

      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Trunking>'
      end
    end
  end
end