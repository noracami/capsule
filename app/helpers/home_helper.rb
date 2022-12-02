# frozen_string_literal: true

module HomeHelper
  def custom_helper
    require 'facebook_ads'

    access_token = ENV['ACCESS_TOKEN']
    pixel_id = ENV['ADS_PIXEL_ID']

    FacebookAds.configure do |config|
      config.access_token = access_token
    end

    user_data = FacebookAds::ServerSide::UserData.new(
      emails: ['joe@eg.com'],
      phones: %w[12345678901 14251234567],
      # It is recommended to send Client IP and User Agent for Conversions API Events.
      client_ip_address: request.remote_ip,
      client_user_agent: request.user_agent
    )

    content = FacebookAds::ServerSide::Content.new(
      product_id: 'product123',
      quantity: 1,
      delivery_category: 'home_delivery'
    )

    custom_data = FacebookAds::ServerSide::CustomData.new(
      contents: [content],
      currency: 'usd',
      value: 123.45
    )

    event = FacebookAds::ServerSide::Event.new(
      event_name: 'Purchase',
      event_time: Time.now.to_i,
      user_data:,
      custom_data:,
      event_source_url: 'https://www.noracami.cc/users/sign_up',
      action_source: 'website'
    )

    request = FacebookAds::ServerSide::EventRequest.new(
      pixel_id:,
      events: [event]
      # test_event_code: "TEST69072"
    )

    print request.execute
  end
end
