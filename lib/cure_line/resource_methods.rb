module CureLine
  module ResourceMethods
    def resource_url(resource_id)
      raise ArgumentError, "resource_id is required" unless resource_id

      "https://obs.line-scdn.net/#{resource_id}"
    end
  end
end
