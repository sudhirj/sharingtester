class HomeController < ApplicationController
	def index
	end

	def analyze
		radar_endpoint = 'http://r7-radar.herokuapp.com/v1/basic'
		response = HTTParty.get "#{radar_endpoint}?url=#{URI::escape params[:url]}"
		@analysis = Hashie::Mash.new JSON.parse response.body
		render 'analysis', layout: nil
	end
end
