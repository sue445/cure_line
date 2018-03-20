require "cure_line/version"
require "hashie"

module CureLine
  autoload :Mash,            "cure_line/mash"
  autoload :Post,            "cure_line/post"
  autoload :ResourceMethods, "cure_line/resource_methods"
  autoload :TimeMethods,     "cure_line/time_methods"
  autoload :User,            "cure_line/user"
end
