require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
IRB.conf[:EVAL_HISTORY] = 10

def pbcopy(input)
  str = input.to_s
  IO.popen('pbcopy', 'w') { |f| f << str }
  str
end

def pbpaste
  `pbpaste`
end

def event_store
  Rails.configuration.event_store
end

def command_bus
  Rails.configuration.command_bus
end

def seppuku
  Process.kill("KILL", Process.pid)
end
