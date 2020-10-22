require 'claide'
require 'colored2'

module OceanWechatRobot

  class Command < CLAide::Command
    # 命令
    self.command = 'ocean_wecaht_robot'
    # 简述
    self.summary = '微信群机器人工具'
    # 描述
    self.description = '微信群机器人工具，可以向微信群发送消息'

    # 参数选项
    def self.options
      [
          ['--webhook=wechat group webhook', '微信群的webhook'],
          ['--msg=content', '微信群消息'],
          ['--msg-type=[text|markdown|news]', '微信群消息的类型'],
          ['--at-mobiles=phone', '@人的手机号，多个用,分割'],
      ].concat(super)
    end

    # ===== 1
    # 运行入口，这里可以坐一些初始化，其他的依赖校验，比如 git 版本等等
    # @param argv 是 Array 类型
    def self.run(argv)
      super(argv)
    end

    # ===== 2
    # 初始化
    # @param argv 是 CLAide::ARGV 类型
    def initialize(argv)
      super
      @webhook = argv.option('webhook')
      @msg = argv.option('msg')
      @msg_type = argv.option('msg-type')
      @at_mobiles = argv.option("at-mobiles", "").split(",")
    end

    # ===== 3
    # 参数校验
    def validate!
      super

      unless @webhook
        help!('please set webhook value!')
      end

      unless @msg
        help!('please set msg value!')
      end

      unless @msg_type
        help!('please set msg type value!')
      end

      if @msg_type && !%w(text markdown news).include?(@msg_type)
        help! "`#{@msg_type}' is not a valid msg type!"
      end
    end

    # ===== 3
    # 重写父类run，执行逻辑，不需要调用 super
    def run
      wechat = OceanWechatRobot::WechatRobot.new("#{@webhook}")
      if @msg_type == 'text'
        wechat.send_text(@msg, @at_mobiles)
      elsif @msg_type == 'markdown'
        wechat.send_markdown(@msg, @at_mobiles)
      elsif @msg_type == 'news'
        # wechat.send_news('', '', '', '', @at_mobiles)
        raise 'news 类型未实现......'
      end
    end
  end
end

