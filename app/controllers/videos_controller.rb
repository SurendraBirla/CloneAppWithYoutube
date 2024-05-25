require 'google/apis/youtube_v3'

class VideosController < ApplicationController
  before_action :authenticate_user
    def index
#       api_key = ENV['YOUTUBE_API_KEY'] 
#       channel_id = 'UC4i3eIZZU5U7mxsgXExDmog'
#       youtube_service = YoutubeService.new(api_key)
#       @videos = youtube_service.fetch_videos(channel_id) || []
#  byebug

      api_key = ENV['YOUTUBE_API_KEY']
      Rails.logger.debug "API Key: #{api_key}"
      channel_id = 'UC4i3eIZZU5U7mxsgXExDmog'
      Rails.logger.debug "Channel ID: #{channel_id}"
      youtube_service = YoutubeService.new(api_key)
      # byebug
      @videos = youtube_service.fetch_videos(channel_id) || []
      Rails.logger.debug "Fetched Videos: #{@videos.inspect}"
    end

end