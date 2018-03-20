require "cure_line/version"
require "hashie"

module CureLine
  autoload :Mash,            "cure_line/mash"
  autoload :Post,            "cure_line/post"
  autoload :ResourceMethods, "cure_line/resource_methods"
  autoload :TimeMethods,     "cure_line/time_methods"
  autoload :User,            "cure_line/user"

  # @param user_id [String]
  #
  # @return [CureLine::User]
  #
  # @example
  #   # read https://timeline.line.me/user/_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE
  #   user = CureLine.user("_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE")
  def self.user(user_id)
    User.new(user_id)
  end
end
