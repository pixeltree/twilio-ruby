##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Video < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionList < ListResource
          ##
          # Initialize the CompositionList
          # @param [Version] version Version that contains the resource
          # @return [CompositionList] CompositionList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Compositions"
          end

          ##
          # Lists CompositionInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [composition.Status] status The status
          # @param [Time] date_created_after The date_created_after
          # @param [Time] date_created_before The date_created_before
          # @param [String] room_sid The room_sid
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(status: :unset, date_created_after: :unset, date_created_before: :unset, room_sid: :unset, limit: nil, page_size: nil)
            self.stream(
                status: status,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                room_sid: room_sid,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams CompositionInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [composition.Status] status The status
          # @param [Time] date_created_after The date_created_after
          # @param [Time] date_created_before The date_created_before
          # @param [String] room_sid The room_sid
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(status: :unset, date_created_after: :unset, date_created_before: :unset, room_sid: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                status: status,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                room_sid: room_sid,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields CompositionInstance records from the API.
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
          # Retrieve a single page of CompositionInstance records from the API.
          # Request is executed immediately.
          # @param [composition.Status] status The status
          # @param [Time] date_created_after The date_created_after
          # @param [Time] date_created_before The date_created_before
          # @param [String] room_sid The room_sid
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of CompositionInstance
          def page(status: :unset, date_created_after: :unset, date_created_before: :unset, room_sid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'Status' => status,
                'DateCreatedAfter' => Twilio.serialize_iso8601_datetime(date_created_after),
                'DateCreatedBefore' => Twilio.serialize_iso8601_datetime(date_created_before),
                'RoomSid' => room_sid,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            CompositionPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CompositionInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of CompositionInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            CompositionPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of CompositionInstance records from the API.
          # Request is executed immediately.
          # @param [String] room_sid The room_sid
          # @param [Hash] video_layout The video_layout
          # @param [String] audio_sources The audio_sources
          # @param [String] audio_sources_excluded The audio_sources_excluded
          # @param [String] resolution The resolution
          # @param [composition.Format] format The format
          # @param [String] status_callback The status_callback
          # @param [String] status_callback_method The status_callback_method
          # @param [Boolean] trim The trim
          # @return [CompositionInstance] Newly created CompositionInstance
          def create(room_sid: :unset, video_layout: :unset, audio_sources: :unset, audio_sources_excluded: :unset, resolution: :unset, format: :unset, status_callback: :unset, status_callback_method: :unset, trim: :unset)
            data = Twilio::Values.of({
                'RoomSid' => room_sid,
                'VideoLayout' => Twilio.serialize_object(video_layout),
                'AudioSources' => Twilio.serialize_list(audio_sources) { |e| e },
                'AudioSourcesExcluded' => Twilio.serialize_list(audio_sources_excluded) { |e| e },
                'Resolution' => resolution,
                'Format' => format,
                'StatusCallback' => status_callback,
                'StatusCallbackMethod' => status_callback_method,
                'Trim' => trim,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            CompositionInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Video.V1.CompositionList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionPage < Page
          ##
          # Initialize the CompositionPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [CompositionPage] CompositionPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of CompositionInstance
          # @param [Hash] payload Payload response from the API
          # @return [CompositionInstance] CompositionInstance
          def get_instance(payload)
            CompositionInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Video.V1.CompositionPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionContext < InstanceContext
          ##
          # Initialize the CompositionContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [CompositionContext] CompositionContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Compositions/#{@solution[:sid]}"
          end

          ##
          # Fetch a CompositionInstance
          # @return [CompositionInstance] Fetched CompositionInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            CompositionInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the CompositionInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.CompositionContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionInstance < InstanceResource
          ##
          # Initialize the CompositionInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [CompositionInstance] CompositionInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'status' => payload['status'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_completed' => payload['date_completed'],
                'date_deleted' => payload['date_deleted'],
                'sid' => payload['sid'],
                'room_sid' => payload['room_sid'],
                'audio_sources' => payload['audio_sources'],
                'audio_sources_excluded' => payload['audio_sources_excluded'],
                'video_layout' => payload['video_layout'],
                'resolution' => payload['resolution'],
                'trim' => payload['trim'],
                'format' => payload['format'],
                'bitrate' => payload['bitrate'].to_i,
                'size' => payload['size'],
                'duration' => payload['duration'].to_i,
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [CompositionContext] CompositionContext for this CompositionInstance
          def context
            unless @instance_context
              @instance_context = CompositionContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The account_sid
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [composition.Status] The status
          def status
            @properties['status']
          end

          ##
          # @return [Time] The date_created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [String] The date_completed
          def date_completed
            @properties['date_completed']
          end

          ##
          # @return [String] The date_deleted
          def date_deleted
            @properties['date_deleted']
          end

          ##
          # @return [String] The sid
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The room_sid
          def room_sid
            @properties['room_sid']
          end

          ##
          # @return [String] The audio_sources
          def audio_sources
            @properties['audio_sources']
          end

          ##
          # @return [String] The audio_sources_excluded
          def audio_sources_excluded
            @properties['audio_sources_excluded']
          end

          ##
          # @return [Hash] The video_layout
          def video_layout
            @properties['video_layout']
          end

          ##
          # @return [String] The resolution
          def resolution
            @properties['resolution']
          end

          ##
          # @return [Boolean] The trim
          def trim
            @properties['trim']
          end

          ##
          # @return [composition.Format] The format
          def format
            @properties['format']
          end

          ##
          # @return [String] The bitrate
          def bitrate
            @properties['bitrate']
          end

          ##
          # @return [String] The size
          def size
            @properties['size']
          end

          ##
          # @return [String] The duration
          def duration
            @properties['duration']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Fetch a CompositionInstance
          # @return [CompositionInstance] Fetched CompositionInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the CompositionInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.CompositionInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.CompositionInstance #{values}>"
          end
        end
      end
    end
  end
end