##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class CallList < ListResource
            class FeedbackSummaryList < ListResource
              ##
              # Initialize the FeedbackSummaryList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The unique id of the
              #   [Account](https://www.twilio.com/docs/api/rest/account) responsible for creating
              #   this call.
              # @return [FeedbackSummaryList] FeedbackSummaryList
              def initialize(version, account_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Calls/FeedbackSummary.json"
              end

              ##
              # Retrieve a single page of FeedbackSummaryInstance records from the API.
              # Request is executed immediately.
              # @param [Date] start_date Only include usage that has occurred on or after this
              #   date. Format is YYYY-MM-DD. All dates are in UTC.
              # @param [Date] end_date Only include usage that has occurred on or before this
              #   date. Format is YYYY-MM-DD. All dates are in UTC.
              # @param [Boolean] include_subaccounts true to include feedback entries for the
              #   master account and all subaccounts. false to include feedback entries for the
              #   specified account. IncludeSubaccounts is false by default.
              # @param [String] status_callback The URL that Twilio will request when the
              #   Feedback Summary is completed.
              # @param [String] status_callback_method The HTTP method Twilio will use to make
              #   requests to the StatusCallback URL. Either GET or POST.
              # @return [FeedbackSummaryInstance] Newly created FeedbackSummaryInstance
              def create(start_date: nil, end_date: nil, include_subaccounts: :unset, status_callback: :unset, status_callback_method: :unset)
                data = Twilio::Values.of({
                    'StartDate' => Twilio.serialize_iso8601_date(start_date),
                    'EndDate' => Twilio.serialize_iso8601_date(end_date),
                    'IncludeSubaccounts' => include_subaccounts,
                    'StatusCallback' => status_callback,
                    'StatusCallbackMethod' => status_callback_method,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                FeedbackSummaryInstance.new(@version, payload, account_sid: @solution[:account_sid], )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.FeedbackSummaryList>'
              end
            end

            class FeedbackSummaryPage < Page
              ##
              # Initialize the FeedbackSummaryPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [FeedbackSummaryPage] FeedbackSummaryPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of FeedbackSummaryInstance
              # @param [Hash] payload Payload response from the API
              # @return [FeedbackSummaryInstance] FeedbackSummaryInstance
              def get_instance(payload)
                FeedbackSummaryInstance.new(@version, payload, account_sid: @solution[:account_sid], )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.FeedbackSummaryPage>'
              end
            end

            class FeedbackSummaryContext < InstanceContext
              ##
              # Initialize the FeedbackSummaryContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] sid The sid
              # @return [FeedbackSummaryContext] FeedbackSummaryContext
              def initialize(version, account_sid, sid)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, sid: sid, }
                @uri = "/Accounts/#{@solution[:account_sid]}/Calls/FeedbackSummary/#{@solution[:sid]}.json"
              end

              ##
              # Fetch a FeedbackSummaryInstance
              # @return [FeedbackSummaryInstance] Fetched FeedbackSummaryInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                FeedbackSummaryInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the FeedbackSummaryInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.FeedbackSummaryContext #{context}>"
              end
            end

            class FeedbackSummaryInstance < InstanceResource
              ##
              # Initialize the FeedbackSummaryInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The unique id of the
              #   [Account](https://www.twilio.com/docs/api/rest/account) responsible for creating
              #   this call.
              # @param [String] sid The sid
              # @return [FeedbackSummaryInstance] FeedbackSummaryInstance
              def initialize(version, payload, account_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'call_count' => payload['call_count'].to_i,
                    'call_feedback_count' => payload['call_feedback_count'].to_i,
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'end_date' => Twilio.deserialize_iso8601_datetime(payload['end_date']),
                    'include_subaccounts' => payload['include_subaccounts'],
                    'issues' => payload['issues'],
                    'quality_score_average' => payload['quality_score_average'].to_f,
                    'quality_score_median' => payload['quality_score_median'].to_f,
                    'quality_score_standard_deviation' => payload['quality_score_standard_deviation'].to_f,
                    'sid' => payload['sid'],
                    'start_date' => Twilio.deserialize_iso8601_datetime(payload['start_date']),
                    'status' => payload['status'],
                }

                # Context
                @instance_context = nil
                @params = {'account_sid' => account_sid, 'sid' => sid || @properties['sid'], }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [FeedbackSummaryContext] FeedbackSummaryContext for this FeedbackSummaryInstance
              def context
                unless @instance_context
                  @instance_context = FeedbackSummaryContext.new(@version, @params['account_sid'], @params['sid'], )
                end
                @instance_context
              end

              ##
              # @return [String] The account_sid
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The call_count
              def call_count
                @properties['call_count']
              end

              ##
              # @return [String] The call_feedback_count
              def call_feedback_count
                @properties['call_feedback_count']
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
              # @return [Time] The end_date
              def end_date
                @properties['end_date']
              end

              ##
              # @return [Boolean] The include_subaccounts
              def include_subaccounts
                @properties['include_subaccounts']
              end

              ##
              # @return [String] The issues
              def issues
                @properties['issues']
              end

              ##
              # @return [String] The quality_score_average
              def quality_score_average
                @properties['quality_score_average']
              end

              ##
              # @return [String] The quality_score_median
              def quality_score_median
                @properties['quality_score_median']
              end

              ##
              # @return [String] The quality_score_standard_deviation
              def quality_score_standard_deviation
                @properties['quality_score_standard_deviation']
              end

              ##
              # @return [String] The sid
              def sid
                @properties['sid']
              end

              ##
              # @return [Time] The start_date
              def start_date
                @properties['start_date']
              end

              ##
              # @return [feedback_summary.Status] The status
              def status
                @properties['status']
              end

              ##
              # Fetch a FeedbackSummaryInstance
              # @return [FeedbackSummaryInstance] Fetched FeedbackSummaryInstance
              def fetch
                context.fetch
              end

              ##
              # Deletes the FeedbackSummaryInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.FeedbackSummaryInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.FeedbackSummaryInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end