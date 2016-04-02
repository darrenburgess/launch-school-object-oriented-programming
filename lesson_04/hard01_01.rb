class SecretFile
  attr_accessor :logger

  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    logger.create_log_entry
    @data
  end
end

class SecurityLogger
  attr_accessor :log
  def initialize
    @log = []
  end
  
  def create_log_entry
    log << Time.new     
  end
end

access_times = SecurityLogger.new

file = SecretFile.new("data", access_times)

puts file.data
puts access_times.log
sleep(2)
puts file.data
puts access_times.log

