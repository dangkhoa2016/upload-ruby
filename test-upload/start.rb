# require_relative '../upload/1-single.rb'

# require_relative '../upload/2-multiple.1.rb'

# wait for retry time
# require_relative '../upload/2-multiple.2.rb'

# divide to max allow request
# require_relative '../upload/2-multiple.3.rb'

# no package
# require_relative '../upload/3-concurrency.1.rb'

# using good package
require_relative '../upload/3-concurrency.2.rb'


number_process = 12

start_time = Time.new
puts "Start at: #{start_time}"

begin
  Test.new.start(number_process)
rescue StandardError => e
  puts "error", e
end

end_time = Time.new
puts "End at: #{end_time}"

seconds_diff = (end_time - start_time).to_f.abs
puts "Total: #{seconds_diff} second(s)"
