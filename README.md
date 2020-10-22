# OceanWechatRobot

通过机器人向微信群发送消息

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ocean_wechat_robot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ocean_wechat_robot

## Usage


```
ocean_wechat_robot --webhook="https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=微信群key" --msg="测试一下" --msg-type="text" --at-mobiles="电话1,电话2"
```

- `--webhook`: 微信群的webhook链接
- `--msg`: 需要发送的消息
- `--msg-type`: 消息类型，支持 `text` `markdown`
- `--at-mobiles`: 需要 @人的手机号，多个用 `,` 拼接


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ocean_wechat_robot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OceanWechatRobot project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ocean_wechat_robot/blob/master/CODE_OF_CONDUCT.md).
