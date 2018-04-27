##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Preview < Domain
      class Understand < Version
        class AssistantContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class IntentList < ListResource
            ##
            # Initialize the IntentList
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The assistant_sid
            # @return [IntentList] IntentList
            def initialize(version, assistant_sid: nil)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid}
              @uri = "/Assistants/#{@solution[:assistant_sid]}/Intents"
            end

            ##
            # Lists IntentInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams IntentInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields IntentInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of IntentInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of IntentInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              IntentPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of IntentInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of IntentInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              IntentPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of IntentInstance records from the API.
            # Request is executed immediately.
            # @param [String] unique_name The unique_name
            # @param [String] friendly_name The friendly_name
            # @return [IntentInstance] Newly created IntentInstance
            def create(unique_name: nil, friendly_name: :unset)
              data = Twilio::Values.of({'UniqueName' => unique_name, 'FriendlyName' => friendly_name, })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              IntentInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Understand.IntentList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class IntentPage < Page
            ##
            # Initialize the IntentPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [IntentPage] IntentPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of IntentInstance
            # @param [Hash] payload Payload response from the API
            # @return [IntentInstance] IntentInstance
            def get_instance(payload)
              IntentInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Understand.IntentPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class IntentContext < InstanceContext
            ##
            # Initialize the IntentContext
            # @param [Version] version Version that contains the resource
            # @param [String] assistant_sid The assistant_sid
            # @param [String] sid The sid
            # @return [IntentContext] IntentContext
            def initialize(version, assistant_sid, sid)
              super(version)

              # Path Solution
              @solution = {assistant_sid: assistant_sid, sid: sid, }
              @uri = "/Assistants/#{@solution[:assistant_sid]}/Intents/#{@solution[:sid]}"

              # Dependents
              @fields = nil
              @samples = nil
            end

            ##
            # Fetch a IntentInstance
            # @return [IntentInstance] Fetched IntentInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              IntentInstance.new(
                  @version,
                  payload,
                  assistant_sid: @solution[:assistant_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the IntentInstance
            # @param [String] friendly_name The friendly_name
            # @param [String] unique_name The unique_name
            # @return [IntentInstance] Updated IntentInstance
            def update(friendly_name: :unset, unique_name: :unset)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, 'UniqueName' => unique_name, })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              IntentInstance.new(
                  @version,
                  payload,
                  assistant_sid: @solution[:assistant_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the IntentInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Access the fields
            # @return [FieldList]
            # @return [FieldContext] if sid was passed.
            def fields(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return FieldContext.new(@version, @solution[:assistant_sid], @solution[:sid], sid, )
              end

              unless @fields
                @fields = FieldList.new(
                    @version,
                    assistant_sid: @solution[:assistant_sid],
                    intent_sid: @solution[:sid],
                )
              end

              @fields
            end

            ##
            # Access the samples
            # @return [SampleList]
            # @return [SampleContext] if sid was passed.
            def samples(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return SampleContext.new(@version, @solution[:assistant_sid], @solution[:sid], sid, )
              end

              unless @samples
                @samples = SampleList.new(
                    @version,
                    assistant_sid: @solution[:assistant_sid],
                    intent_sid: @solution[:sid],
                )
              end

              @samples
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Understand.IntentContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class IntentInstance < InstanceResource
            ##
            # Initialize the IntentInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] assistant_sid The assistant_sid
            # @param [String] sid The sid
            # @return [IntentInstance] IntentInstance
            def initialize(version, payload, assistant_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'links' => payload['links'],
                  'assistant_sid' => payload['assistant_sid'],
                  'sid' => payload['sid'],
                  'unique_name' => payload['unique_name'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'assistant_sid' => assistant_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [IntentContext] IntentContext for this IntentInstance
            def context
              unless @instance_context
                @instance_context = IntentContext.new(@version, @params['assistant_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date_updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The friendly_name
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The links
            def links
              @properties['links']
            end

            ##
            # @return [String] The assistant_sid
            def assistant_sid
              @properties['assistant_sid']
            end

            ##
            # @return [String] The sid
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The unique_name
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # Fetch a IntentInstance
            # @return [IntentInstance] Fetched IntentInstance
            def fetch
              context.fetch
            end

            ##
            # Update the IntentInstance
            # @param [String] friendly_name The friendly_name
            # @param [String] unique_name The unique_name
            # @return [IntentInstance] Updated IntentInstance
            def update(friendly_name: :unset, unique_name: :unset)
              context.update(friendly_name: friendly_name, unique_name: unique_name, )
            end

            ##
            # Deletes the IntentInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the fields
            # @return [fields] fields
            def fields
              context.fields
            end

            ##
            # Access the samples
            # @return [samples] samples
            def samples
              context.samples
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.IntentInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.IntentInstance #{values}>"
            end
          end
        end
      end
    end
  end
end