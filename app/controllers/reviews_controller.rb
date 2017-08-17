class ReviewsController < ApplicationController

  def pullandshow  # pull data and display (to test API)

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

  def save_reviews # execute once

    conn = Faraday.new(:url => 'https://private-anon-d12402341a-birdeye.apiary-mock.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.post "/resources/v1/review/businessId/149440583942847?sindex=0&count=10&api_key=#{ENV['API_KEY']}"
    @data = response.body

    @parsed_data = JSON.parse @data

    @parsed_data.each do |review|
      Review.create(
        review_id: review['reviewId'],
        rating: review['rating'],
        comments: review['comments'],
        title: review['title'],
        firstname: review['reviewer']['firstName'],
        lastname: review['reviewer']['lastName'],
        nickname: review['reviewer']['nickName'],
        thumbnailurl: review['reviewer']['thumbnailUrl'],
        email_id: review['reviewer']['emailId'],
        facebook_id: review['reviewer']['facebookId'],
        city: review['reviewer']['city'],
        state: review['reviewer']['state'],
        reviewurl: review['reviewURL'],
        sourcetype: review['sourceType'],
        reviewdate: review['reviewDate'],
        response: review['response'],
        responsedate: review['responseDate'],
        featured: review['featured']
        )
    end

    redirect_to "/"
  end

  def index # displays reviews from database
    @reviews = Review.all

    render 'index'
  end
end
