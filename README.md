# CureLine
[LINE TIMELINE](https://timeline.line.me/) scraping tool

[![Gem Version](https://badge.fury.io/rb/cure_line.svg)](https://badge.fury.io/rb/cure_line)
[![test](https://github.com/sue445/cure_line/actions/workflows/test.yml/badge.svg)](https://github.com/sue445/cure_line/actions/workflows/test.yml)
[![Maintainability](https://qlty.sh/gh/sue445/projects/cure_line/maintainability.svg)](https://qlty.sh/gh/sue445/projects/cure_line)
[![Coverage Status](https://coveralls.io/repos/github/sue445/cure_line/badge.svg?branch=master)](https://coveralls.io/github/sue445/cure_line?branch=master)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cure_line'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cure_line

## Usage

```ruby
# read https://timeline.line.me/user/_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE
user = CureLine.user("_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE")

user.info
#=> {"mid"=>"_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE",
# "nickname"=>"プリキュア",
# "pictureUrl"=>"https://profile.line-scdn.net/0hU_sA3K0gCnBOOCZuQUx1J3J9BB05Fgw4Nl9BQmxsUEZjCU0jewlCFWo-UEk3CRhxdQtCQ20_VRBk",
# "userValid"=>true,
# "writerMid"=>"_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE"}

user.header_url
#=> "https://obs.line-scdn.net/htzWKFLgwN1RRXiRaCAgwLR0sfTZOB28EU1VjYxs0IWYTAjkDUFViZhhgJjJHUmRR"

post = user.posts.first 

post.nickname
#=> "プリキュア"

post.picture_url
#=> "https://profile.line-scdn.net/0hU_sA3K0gCnBOOCZuQUx1J3J9BB05Fgw4Nl9BQmxsUEZjCU0jewlCFWo-UEk3CRhxdQtCQ20_VRBk"

post.post_url
#=> "https://timeline.line.me/post/_dYbbV3vmaJrvqBoV5ZlpCbPN2CWUZdDQayBvjBE/1152127900305060448"

post.text
#=> "プリキュアになってから、さあやとほまれとますます仲良くなれて、\n超うれしー！！＼(^o^)／\n今日はビューティーハリーで、お互いに洋服をコーディネイトし合ったんだ～。\n\nさあやは、大人っぽいデザインのスカートがめっちゃ似合ってた！\nう～ん、絵のモデルさんになれそうなくらい素敵！( *´艸｀)\n\nほまれはオシャレ上級者しか着こなせないような、最先端のオールインワンがぴったり！\n背が高くて、足が長い人はいいな～、うぅ……(T_T)\n\nはぐたんはくまさんの耳がついたフードをかぶって……。\nきゃ、きゃ、きゃわたん～～～～(・´з`・)\n拝みたくなる可愛さでした♡\n\nで……私は！？私は何が似合うかな！？\nえっ……ハリーおすすめのどデカイ虎の絵が描いてあるトレーナー！！？\nみんな、似合ってるって言ってくれるけど……お腹抱えて笑ってるじゃん！！ヽ(`Д´)ﾉﾌﾟﾝﾌﾟﾝ\n\nう～ん、でも言われてみれば、たしかに似合ってるような……。\nこれを着こなせるって、逆にすごいかも☆(^ε^)\nはぁ～、今日もいい一日でした！"

post.created_time
#=> 2018-03-17 18:30:03 +0900

post.updated_time
#=> 2018-03-17 18:30:03 +0900

post.photo_urls
#=> ["https://obs.line-scdn.net/h5XG4_2KndnZXIWV4GHdxDwZTY0ZUe34iR3snQghNNkNUfSx0Qy4lRF9PPERUeS8iQy9gFwtOYENTfg"]
```

### [Config](lib/cure_line/config.rb)
```ruby
CureLine.config.user_agent = "XXXX"
```

* `user_agent` : User Agent

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sue445/cure_line.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
