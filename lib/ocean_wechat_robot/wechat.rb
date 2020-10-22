
module OceanWechatRobot

  class WechatRobot
    require 'httparty'

    attr_accessor :webhook_url

    # 初始化
    def initialize(webhook_url)
      @webhook_url = webhook_url
    end

    # 处理手机号
    def handle_at_mobiles(at_mobiles = [], is_at_all = false)
      mobiles = []
      if is_at_all
        mobiles.push("@all")
      else
        mobiles.concat(at_mobiles)
      end
      mobiles
    end

    def send_text(content = '', at_mobiles = [], is_at_all = false)
      mobile_list = handle_at_mobiles(at_mobiles, is_at_all)
      data = {
          "msgtype" => "text",
          "text" => {
              "content" => content,
              "mentioned_mobile_list" => mobile_list
          }
      }
      HTTParty.post(@webhook_url, body: data.to_json).parsed_response
    end

    def send_markdown(content = '', at_mobiles = [])
      data = {
          "msgtype" => "markdown",
          "markdown" => {
              "content" => content
          }
      }
      HTTParty.post(@webhook_url, body: data.to_json).parsed_response

      # 再发送@人的消息
      if !at_mobiles.empty?
        send_text('', at_mobiles)
      end
    end

    def send_news(title = '', description = '', url = '', picurl = '', at_mobiles = [])
      data = {
          "msgtype" => "news",
          "news" => {
              "articles" => [
                  {
                      "title" => title,
                      "description" => description,
                      "url" => url,
                      "picurl" => picurl
                  }
              ]
          }
      }

      HTTParty.post(@webhook_url, body: data.to_json).parsed_response

      # 再发送@人的消息
      if !at_mobiles.empty?
        send_text('', at_mobiles)
      end
    end
  end
end