require 'youtube_addy'
require 'vimeo_addy'

module ArticleHelper
  @@EMBED_VIDEO_STRING_TEMPLATE = '<iframe src="%s" width="%s" height="%s" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'

  def embeded_video_string(video_url, width = 640, height = 360)
    if video_url.include?('youtube.com') || video_url.include?('youtu.be')
      return @@EMBED_VIDEO_STRING_TEMPLATE % [YouTubeAddy.embed_url(video_url), width, height]
    elsif video_url.include?('vimeo.com')
      return @@EMBED_VIDEO_STRING_TEMPLATE % [VimeoAddy.embed_url(video_url), width, height]
    else
      return ''
    end
  end
end
