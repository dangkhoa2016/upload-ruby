require_relative '../helper.rb'

class Test
  MAX_ALLOW = 5

  def start(number_process)
    number_process = 1 if number_process.nil? || number_process < 1

    run_batch(Array(1..number_process))
  end

  def run_batch(arr)
    Parallel.map(arr, in_threads: MAX_ALLOW) do |item|
        Helper.upload(item)
    end
  end
end
