require_relative '../helper.rb'

class Test
  MAX_ALLOW = 5

  def start(number_process)
    number_process = 1 if number_process.nil? || number_process < 1

    number_batch = number_process.fdiv(MAX_ALLOW).ceil

    (1..number_batch).each do |i|
      from = (i - 1) * MAX_ALLOW + 1
      to = i * MAX_ALLOW
      to = number_process if to > number_process
      run_batch(Array(from..to))
    end
  end

  def run_batch(arr)
    threads = []
    
    arr.each do |item|
      threads << Thread.new(item) do
        Helper.upload(item)
      end
    end

    threads.each { |t| t.join }
  end
end
