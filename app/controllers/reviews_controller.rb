class ReviewsController < ApplicationController
  def pullandshow

    conn = Faraday.new(:url => 'https://private-anon-d12402341a-birdeye.apiary-mock.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.post "/resources/v1/review/businessId/149440583942847?sindex=0&count=10&api_key=#{ENV['API_KEY']}"
    @data = response.body

    @parsed_data = JSON.parse @data

    render 'pullandshow'
  end

  def save_reviews
  end

  def index
    render 'index'
  end
end
