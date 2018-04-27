##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Message' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .messages.create(to: '+15558675310')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'To' => '+15558675310', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages.json',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
          "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
          "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
          "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
          "direction": "outbound-api",
          "error_code": null,
          "error_message": null,
          "from": "+14155552345",
          "messaging_service_sid": "MGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "num_media": "0",
          "num_segments": "1",
          "price": "-0.00750",
          "price_unit": "USD",
          "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "sent",
          "subresource_uris": {
              "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
          },
          "to": "+14155552345",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages.create(to: '+15558675310')

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
          "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
          "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
          "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
          "direction": "outbound-api",
          "error_code": null,
          "error_message": null,
          "from": "+14155552345",
          "messaging_service_sid": "MGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "num_media": "0",
          "num_segments": "1",
          "price": "-0.00750",
          "price_unit": "USD",
          "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "sent",
          "subresource_uris": {
              "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
          },
          "to": "+14155552345",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .messages.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages.json',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=0",
          "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=119771",
          "messages": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "api_version": "2010-04-01",
                  "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
                  "date_created": "Fri, 04 Sep 2015 22:54:39 +0000",
                  "date_sent": "Fri, 04 Sep 2015 22:54:41 +0000",
                  "date_updated": "Fri, 04 Sep 2015 22:54:41 +0000",
                  "direction": "outbound-api",
                  "error_code": null,
                  "error_message": null,
                  "from": "+14155552345",
                  "messaging_service_sid": "MGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "num_media": "0",
                  "num_segments": "1",
                  "price": "-0.00750",
                  "price_unit": "USD",
                  "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "status": "sent",
                  "subresource_uris": {
                      "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
                  },
                  "to": "+14155552345",
                  "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
              }
          ],
          "next_page_uri": null,
          "num_pages": 119772,
          "page": 0,
          "page_size": 1,
          "previous_page_uri": null,
          "start": 0,
          "total": 119772,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=0",
          "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=119771",
          "messages": [],
          "next_page_uri": null,
          "num_pages": 119772,
          "page": 0,
          "page_size": 1,
          "previous_page_uri": null,
          "start": 0,
          "total": 119772,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages.json?PageSize=1&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(body: 'body')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Body' => 'body', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
        data: values,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "body": "O Slash: \u00d8, PoP: \ud83d\udca9",
          "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
          "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
          "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
          "direction": "outbound-api",
          "error_code": null,
          "error_message": null,
          "from": "+14155552345",
          "messaging_service_sid": "MGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "num_media": "0",
          "num_segments": "1",
          "price": "-0.00750",
          "price_unit": "USD",
          "sid": "SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "status": "sent",
          "subresource_uris": {
              "media": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Media.json"
          },
          "to": "+14155552345",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/SMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages('MMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(body: 'body')

    expect(actual).to_not eq(nil)
  end
end