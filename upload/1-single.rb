require_relative '../helper.rb'

class Test
  def start(number_process)
    number_process = 1 if number_process.nil? || number_process < 1

    run_batch(Array(1..number_process))
  end

  def run_batch(arr)
    arr.each do |item|
      Helper.upload(item)
    end
  end
end
