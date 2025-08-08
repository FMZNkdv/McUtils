require_relative 'bot'

class BotManager
  SERVER_HOST = 'localhost'
  SERVER_PORT = 45512
  MC_VERSION = '1.12.2'
  BOT_COUNT = 1000000
  CONNECT_DELAY_MS = 4.35
  BOT_NAME = 'fmznk'

  def initialize
    @bots = []
  end

  def run
    (1..BOT_COUNT).each do |i|
      create_bot(i)
      puts "#{i} | #{CONNECT_DELAY_MS}"
      sleep(CONNECT_DELAY_MS)
    end
  end

  private

  def create_bot(index)
    username = "#{BOT_NAME}#{index}"
    bot = Bot.new(SERVER_HOST, SERVER_PORT, username, MC_VERSION, 'offline')
    Thread.new { bot.connect }
    @bots << bot
  end
end