class Television
  def self.manufacturer
    puts "manufacturer" 
  end

  def model
    puts "model"  
  end
end

tv = Television.new
#tv.manufacturer # no method error because class method
tv.model # invokes method properly

Television.manufacturer # invokes method properly
Television.model # no method error
