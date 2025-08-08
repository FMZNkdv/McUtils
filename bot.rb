class Bot
  attr_reader :username

  def initialize(host, port, username, version, auth)
    @host = host
    @port = port
    @username = username
    @version = version
    @auth = auth
    @connected = false
  end

  def connect
    @connected = true
    login
  rescue => e
    handle_error(e)
  end

  def login
    puts "#{@username} connected"
    chat('/register botutils botutils')
    chat('/reg botutils botutils')

    start_jumping
    start_chatting
    spawn
  end

  def spawn
    set_control_state('forward', true)
    sleep(1)
    set_control_state('forward', false)
  end

  def start_jumping
    @jump_thread = Thread.new do
      loop do
        set_control_state('jump', true)
        sleep(0.5)
        set_control_state('jump', false)
        sleep(0.5)
      end
    end
  end

  def start_chatting
    @chat_thread = Thread.new do
      loop do
        chat('ВАС ЕБУТ! БОТЫ ОТ tg@FMZNkdv')
        sleep(0.975)
      end
    end
  end

  def chat(message)
    puts "#{@username} says: #{message}"
  end

  def set_control_state(control, state)
    puts "#{@username} sets #{control} to #{state}"
  end

  def handle_error(error)
    puts "#{@username} encountered error: #{error.message}"
  end

  def kicked(reason)
    puts "#{@username} was kicked: #{reason}"
  end

  def disconnect
    return unless @connected
    puts "#{@username} disconnected"
    @jump_thread.kill if @jump_thread
    @chat_thread.kill if @chat_thread
    @connected = false
  end
end