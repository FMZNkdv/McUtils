# McUtils - Minecraft Utils

![Ruby Version](https://img.shields.io/badge/Ruby-3.x+-red)
![Minecraft](https://img.shields.io/badge/Minecraft-all_version-green)

## Features
- Creates multiple bots with sequential usernames
- Automatic registration/login simulation
- Periodic chat message flooding
- Continuous jumping animation
- Forward movement on spawn
- Error handling and disconnect logging
- Configurable connection delays and bot count

## Requirements
- Ruby 3.0+
- Basic understanding of Minecraft servers

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/FMZNkdv/MCUtils.git
   cd MCUtils
   ```

## Configuration
Edit `config.rb` to configure:
```ruby
SERVER_HOST = 'your.server.ip'   # Server
SERVER_PORT = 25565              # Port
BOT_COUNT = 100                  # Count
CONNECT_DELAY_MS = 4.35          # Delay
CHAT_INTERVAL_MS = 0.975         # Chat/s
JUMP_INTERVAL_MS = 1.0           # Jump/s
```

## Usage
Run the main script:
```bash
ruby main.rb
```

### Expected Output
```
1 | 4.35
fmznk1 connected
fmznk1 says: /register botutils botutils
fmznk1 says: /reg botutils botutils
fmznk1 sets jump to true
fmznk1 sets jump to false
fmznk1 says: ВАС ЕБУТ! БОТЫ ОТ tg@FMZNkdv
...
```
## Limitations
1. **Simulation Only**: This implementation prints actions to console instead of connecting to real servers
2. **Thread Limitations**: Creating thousands of threads may require optimization
3. **No Real Networking**: Actual Minecraft protocol integration requires additional libraries

## Adding Real Minecraft Connectivity
To connect to real Minecraft servers:

1. Install a Ruby Minecraft client gem:
   ```bash
   gem install emc
   ```

2. Modify `bot.rb` connection methods:
   ```ruby
   require 'emc'

   def connect
     @client = EMC::Client.new(@host, @port)
     @client.on_login { login_success }
     # Add protocol handlers...
   end
   ```
   
## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

## Author
[@FMZNkdv :3](https://t.me/FMZNkdv)
