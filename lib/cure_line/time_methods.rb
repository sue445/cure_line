module CureLine
  module TimeMethods
    # @param unixtime [Integer]
    #
    # @return [ActiveSupport::TimeWithZone] When `Time.zone` is initialized
    # @return [Time] When `Time.zone` is not initialized or without activesupport
    def time_at(unixtime)
      if Time.respond_to?(:zone) && Time.zone.respond_to?(:at)
        Time.zone.at(unixtime)
      else
        Time.at(unixtime)
      end
    end
  end
end
