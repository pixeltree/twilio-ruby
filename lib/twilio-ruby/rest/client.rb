##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    ##
    # A client for accessing the Twilio API.
    class Client
      attr_accessor :http_client, :username, :password, :account_sid, :auth_token, :region

      ##
      # Initializes the Twilio Client
      def initialize(username=nil, password=nil, account_sid=nil, region=nil, http_client=Twilio::HTTP::Client.new)
        @username = username || Twilio.account_sid
        @password = password || Twilio.auth_token
        @region = region
        @account_sid = account_sid || @username
        @auth_token = @password
        @auth = [@username, @password]
        @http_client = http_client

        # Domains
        @accounts = nil
        @api = nil
        @chat = nil
        @fax = nil
        @ip_messaging = nil
        @lookups = nil
        @monitor = nil
        @notify = nil
        @preview = nil
        @pricing = nil
        @proxy = nil
        @taskrouter = nil
        @trunking = nil
        @video = nil
        @messaging = nil
        @wireless = nil
        @sync = nil
        @studio = nil
      end

      ##
      # Makes a request to the Twilio API using the configured http client
      # Authentication information is automatically added if none is provided
      def request(host, port, method, uri, params={}, data={}, headers={}, auth=nil, timeout=nil)
        auth ||= @auth

        headers['User-Agent'] = "twilio-ruby/#{Twilio::VERSION}" +
                                " (#{RUBY_ENGINE}/#{RUBY_PLATFORM}" +
                                " #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL})"
        headers['Accept-Charset'] = 'utf-8'

        if method == 'POST' && !headers['Content-Type']
          headers['Content-Type'] = 'application/x-www-form-urlencoded'
        end

        unless headers['Accept']
          headers['Accept'] = 'application/json'
        end

        if !region.nil?
            head, tail  = uri.split('.', 2)
            if !tail.start_with?(region)
                uri = [head, region, tail].join('.')
            end
        end

        @http_client.request(
          host,
          port,
          method,
          uri,
          params,
          data,
          headers,
          auth,
          timeout
        )
      end

      ##
      # Access the Accounts Twilio Domain
      def accounts
        @accounts ||= Accounts.new self
      end

      ##
      # Access the Api Twilio Domain
      def api
        @api ||= Api.new self
      end

      ##
      # Access the Chat Twilio Domain
      def chat
        @chat ||= Chat.new self
      end

      ##
      # Access the Fax Twilio Domain
      def fax
        @fax ||= Fax.new self
      end

      ##
      # Access the IpMessaging Twilio Domain
      def ip_messaging
        @ip_messaging ||= IpMessaging.new self
      end

      ##
      # Access the Lookups Twilio Domain
      def lookups
        @lookups ||= Lookups.new self
      end

      ##
      # Access the Monitor Twilio Domain
      def monitor
        @monitor ||= Monitor.new self
      end

      ##
      # Access the Notify Twilio Domain
      def notify
        @notify ||= Notify.new self
      end

      ##
      # Access the Preview Twilio Domain
      def preview
        @preview ||= Preview.new self
      end

      ##
      # Access the Pricing Twilio Domain
      def pricing
        @pricing ||= Pricing.new self
      end

      ##
      # Access the Proxy Twilio Domain
      def proxy
        @proxy ||= Proxy.new self
      end

      ##
      # Access the Taskrouter Twilio Domain
      def taskrouter
        @taskrouter ||= Taskrouter.new self
      end

      ##
      # Access the Trunking Twilio Domain
      def trunking
        @trunking ||= Trunking.new self
      end

      ##
      # Access the Video Twilio Domain
      def video
        @video ||= Video.new self
      end

      ##
      # Access the Messaging Twilio Domain
      def messaging
        @messaging ||= Messaging.new self
      end

      ##
      # Access the Wireless Twilio Domain
      def wireless
        @wireless ||= Wireless.new self
      end

      ##
      # Access the Sync Twilio Domain
      def sync
        @sync ||= Sync.new self
      end

      ##
      # Access the Studio Twilio Domain
      def studio
        @studio ||= Studio.new self
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this address.
      # @return [Twilio::REST::Api::V2010::AccountContext::AddressInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::AddressList]
      def addresses(sid=:unset)
        self.api.v2010.account.addresses(sid)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::ApplicationInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::ApplicationList]
      def applications(sid=:unset)
        self.api.v2010.account.applications(sid)
      end

      ##
      # @param [String] connect_app_sid The unique id of the Connect App that was
      #   authorized.
      # @return [Twilio::REST::Api::V2010::AccountContext::AuthorizedConnectAppInstance] if connect_app_sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::AuthorizedConnectAppList]
      def authorized_connect_apps(connect_app_sid=:unset)
        self.api.v2010.account.authorized_connect_apps(connect_app_sid)
      end

      ##
      # @param [String] country_code The ISO Country code to lookup phone numbers for.
      # @return [Twilio::REST::Api::V2010::AccountContext::AvailablePhoneNumberCountryInstance] if country_code was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::AvailablePhoneNumberCountryList]
      def available_phone_numbers(country_code=:unset)
        self.api.v2010.account.available_phone_numbers(country_code)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::CallInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::CallList]
      def calls(sid=:unset)
        self.api.v2010.account.calls(sid)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   conference.
      # @return [Twilio::REST::Api::V2010::AccountContext::ConferenceInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::ConferenceList]
      def conferences(sid=:unset)
        self.api.v2010.account.conferences(sid)
      end

      ##
      # @param [String] sid The unique id of this Connect App.
      # @return [Twilio::REST::Api::V2010::AccountContext::ConnectAppInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::ConnectAppList]
      def connect_apps(sid=:unset)
        self.api.v2010.account.connect_apps(sid)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::IncomingPhoneNumberInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::IncomingPhoneNumberList]
      def incoming_phone_numbers(sid=:unset)
        self.api.v2010.account.incoming_phone_numbers(sid)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this API Key.
      #    You will use this as the basic-auth `user` when authenticating to the API.
      # @return [Twilio::REST::Api::V2010::AccountContext::KeyInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::KeyList]
      def keys(sid=:unset)
        self.api.v2010.account.keys(sid)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::MessageInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::MessageList]
      def messages(sid=:unset)
        self.api.v2010.account.messages(sid)
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::NewKeyInstance]
      def new_keys
        self.api.v2010.account.new_keys
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::NewSigningKeyInstance]
      def new_signing_keys
        self.api.v2010.account.new_signing_keys
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::NotificationInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::NotificationList]
      def notifications(sid=:unset)
        self.api.v2010.account.notifications(sid)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::OutgoingCallerIdInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::OutgoingCallerIdList]
      def outgoing_caller_ids(sid=:unset)
        self.api.v2010.account.outgoing_caller_ids(sid)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this queue.
      # @return [Twilio::REST::Api::V2010::AccountContext::QueueInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::QueueList]
      def queues(sid=:unset)
        self.api.v2010.account.queues(sid)
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::RecordingInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::RecordingList]
      def recordings(sid=:unset)
        self.api.v2010.account.recordings(sid)
      end

      ##
      # @param [String] sid The sid
      # @return [Twilio::REST::Api::V2010::AccountContext::SigningKeyInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::SigningKeyList]
      def signing_keys(sid=:unset)
        self.api.v2010.account.signing_keys(sid)
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::SipInstance]
      def sip
        self.api.v2010.account.sip
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::ShortCodeInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::ShortCodeList]
      def short_codes(sid=:unset)
        self.api.v2010.account.short_codes(sid)
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::TokenInstance]
      def tokens
        self.api.v2010.account.tokens
      end

      ##
      # @param [String] sid A 34 character string that uniquely identifies this
      #   resource.
      # @return [Twilio::REST::Api::V2010::AccountContext::TranscriptionInstance] if sid was passed.
      # @return [Twilio::REST::Api::V2010::AccountContext::TranscriptionList]
      def transcriptions(sid=:unset)
        self.api.v2010.account.transcriptions(sid)
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::UsageInstance]
      def usage
        self.api.v2010.account.usage
      end

      ##
      # @return [Twilio::REST::Api::V2010::AccountContext::ValidationRequestInstance]
      def validation_requests
        self.api.v2010.account.validation_requests
      end

      ##
      # Provide a user friendly representation
      def to_s
        "#<Twilio::REST::Client #{@account_sid}>"
      end
    end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class BaseClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class IpMessagingClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class LookupsClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class MonitorClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class PricingClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class TaskRouterClient < ObsoleteClient; end

    ##
    # Dummy client which provides no functionality. Please use Twilio::REST::Client instead.
    class TrunkingClient < ObsoleteClient; end
  end
end