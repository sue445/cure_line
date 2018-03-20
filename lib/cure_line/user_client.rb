module CureLine
  require "open-uri"

  class UserClient
    attr_reader :user_id

    include ResourceMethods

    # @param user_id [String]
    #
    # @example
    #   # read https://timeline.line.me/user/_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE
    #   client = CureLine::UserClient.new("_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE")
    def initialize(user_id)
      @user_id = user_id
    end

    # @return [CureLine::Mash]
    def info
      preloaded_state["userHome"]["homeInfo"]["userInfo"]
    end

    # @return [String]
    def header_url
      resource_url(preloaded_state["userHome"]["homeInfo"]["resourceId"])
    end

    # @return [Array<CureLine::Post>]
    def posts
      preloaded_state["userHome"]["feeds"].map { |feed| CureLine::Post.new(feed) }
    end

    # @return [CureLine::Mash]
    def preloaded_state
      return @preloaded_state if @preloaded_state

      url = "https://timeline.line.me/user/#{user_id}"
      html = open(url).read

      m = html.match(/window.__PRELOADED_STATE__\s*=\s*({.+})/)
      raise "Not Found window.__PRELOADED_STATE__ in #{url}" unless m

      @preloaded_state = CureLine::Mash.new(JSON.parse(m[1]))
    end
  end
end
