module CureLine
  class Post < Mash
    include TimeMethods
    include ResourceMethods

    # @return [String]
    def nickname
      dig("post", "userInfo", "nickname")
    end

    # @return [String]
    def picture_url
      dig("post", "userInfo", "pictureUrl")
    end

    # @return [String]
    def post_url
      home_id = dig("post", "postInfo", "homeId")
      post_id = dig("post", "postInfo", "postId")
      "https://timeline.line.me/post/#{home_id}/#{post_id}"
    end

    # @return [String]
    def text
      dig("post", "contents", "text")
    end

    # @return [ActiveSupport::TimeWithZone] When `Time.zone` is initialized
    # @return [Time] When `Time.zone` is not initialized or without activesupport
    def created_time
      millisec = dig("post", "postInfo", "createdTime")
      time_at(millisec / 1000)
    end

    # @return [ActiveSupport::TimeWithZone] When `Time.zone` is initialized
    # @return [Time] When `Time.zone` is not initialized or without activesupport
    def updated_time
      millisec = dig("post", "postInfo", "updatedTime")
      time_at(millisec / 1000)
    end

    # @return [Array<String>]
    def photo_urls
      medias.select { |media| media["type"] == "PHOTO" }.map { |media| resource_url(media["resourceId"]) }
    end

    # @return [Array<Hash>]
    def medias
      dig("post", "contents", "media") || []
    end
  end
end
