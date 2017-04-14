class YouTubeAddy
  URL_FORMATS = {
      regular: /^(https?:\/\/)?(www\.)?youtube.com\/watch\?(.*\&)?v=(?<id>[^&]+)/,
      shortened: /^(https?:\/\/)?(www\.)?youtu.be\/(?<id>[^&]+)/,
      embed: /^(https?:\/\/)?(www\.)?youtube.com\/embed\/(?<id>[^&]+)/,
      embed_as3: /^(https?:\/\/)?(www\.)?youtube.com\/v\/(?<id>[^?]+)/,
      chromeless_as3: /^(https?:\/\/)?(www\.)?youtube.com\/apiplayer\?video_id=(?<id>[^&]+)/
  }

  INVALID_CHARS = /[^a-zA-Z0-9\:\/\?\=\&\$\-\_\.\+\!\*\'\(\)\,]/

  def self.has_invalid_chars?(url)
    !INVALID_CHARS.match(url).nil?
  end

  def self.extract_video_id(url)
    return nil if has_invalid_chars?(url)

    URL_FORMATS.values.each do |format_regex|
      match = format_regex.match(url)
      return match[:id] if match
    end
  end

  def self.embed_url(url)
    return "http://www.youtube.com/embed/#{extract_video_id(url)}"
  end

  def self.embed_iframe(url, width = 420, height = 315)
    %(<iframe src="#{embed_url(url)}" width="#{width}" height="#{height}" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>)
  end
end