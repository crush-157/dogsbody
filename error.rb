def write_error(error: )
  STDERR.puts "Error    : #{ error.class.name}"
  STDERR.puts "Message  : #{ error.message }"
  STDERR.puts "Backtrace: #{ error.backtrace }"
end
