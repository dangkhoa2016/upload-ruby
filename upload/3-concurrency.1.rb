require_relative '../helper.rb'
require './thread_pool.rb'

class Test
  MAX_ALLOW = 5

  def start(number_process)
    number_process = 1 if number_process.nil? || number_process < 1

    run_batch(Array(1..number_process))
  end

  def run_batch(arr)
    pool = ThreadPool.new(size: MAX_ALLOW)

    arr.each do |item|
      pool.schedule { Helper.upload(item) }
    end

    pool.run
  end
end
