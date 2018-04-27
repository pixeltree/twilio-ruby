##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Intent' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .intents('UDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/understand/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Intents/UDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "unique_name": "unique_name",
          "links": {
              "fields": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields",
              "samples": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Samples"
          },
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_updated": "2015-07-30T20:00:00Z",
          "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z"
      }
      ]
    ))

    actual = @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .intents('UDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .intents.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/understand/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Intents',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "key": "intents",
              "page_size": 50,
              "next_page_url": null,
              "url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents?PageSize=50&Page=0",
              "page": 0,
              "first_page_url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents?PageSize=50&Page=0",
              "previous_page_url": null
          },
          "intents": []
      }
      ]
    ))

    actual = @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .intents.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "key": "intents",
              "page_size": 50,
              "next_page_url": null,
              "url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents?PageSize=50&Page=0",
              "page": 0,
              "first_page_url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents?PageSize=50&Page=0",
              "previous_page_url": null
          },
          "intents": [
              {
                  "unique_name": "unique_name",
                  "links": {
                      "fields": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields",
                      "samples": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Samples"
                  },
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "friendly_name",
                  "url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z"
              }
          ]
      }
      ]
    ))

    actual = @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .intents.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .intents.create(unique_name: 'unique_name')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'UniqueName' => 'unique_name', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/understand/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Intents',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "unique_name": "unique_name",
          "links": {
              "fields": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields",
              "samples": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Samples"
          },
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_updated": "2015-07-30T20:00:00Z",
          "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z"
      }
      ]
    ))

    actual = @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .intents.create(unique_name: 'unique_name')

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .intents('UDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://preview.twilio.com/understand/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Intents/UDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "unique_name": "unique_name",
          "links": {
              "fields": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Fields",
              "samples": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Samples"
          },
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "url": "https://preview.twilio.com/understand/Assistants/UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Intents/UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "UDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_updated": "2015-07-30T20:00:00Z",
          "assistant_sid": "UAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z"
      }
      ]
    ))

    actual = @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .intents('UDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                .intents('UDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://preview.twilio.com/understand/Assistants/UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Intents/UDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.preview.understand.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                       .intents('UDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end