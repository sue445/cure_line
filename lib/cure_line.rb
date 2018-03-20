require "cure_line/version"
require "hashie"

module CureLine
  autoload :Mash,            "cure_line/mash"
  autoload :Post,            "cure_line/post"
  autoload :ResourceMethods, "cure_line/resource_methods"
  autoload :TimeMethods,     "cure_line/time_methods"
  autoload :UserClient,      "cure_line/user_client"
end
