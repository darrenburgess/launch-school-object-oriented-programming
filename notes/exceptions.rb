class BigValueError < StandardError
end

LIMIT = 333
x = 123_456_789

begin
  if x > LIMIT
    raise BigValueError, "too big"
  end
  
  puts "continuing"

rescue => e
  puts e
  p e
  exit 1
end
