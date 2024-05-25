require 'google/apis/youtube_v3'

class YoutubeService
  def initialize(api_key)
    @youtube = Google::Apis::YoutubeV3::YouTubeService.new
    @youtube.key = api_key
  end

  def fetch_videos(channel_id)
    response = @youtube.list_searches(
      'snippet',
      type: 'video',
      channel_id: channel_id,
      max_results: 50
    )
    response.items
  rescue StandardError => e
    Rails.logger.error "Failed to fetch videos: #{e.message}"
    []
  end
end
