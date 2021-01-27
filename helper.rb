
class Helper
  TOKEN = ENV['TOKEN']
  ENDPOINT = ENV['ENDPOINT']

  def self.upload(index)
    puts "[#{Time.new}] Start post file #{index}"
    
    uri = URI.parse(ENDPOINT)

    headers = { 'Content-Type': 'application/json', token: TOKEN }
    data = {
      client: 'ruby',
      name: "file #{index}",
      file: 'content',
      size: index
    }

    # Create the HTTP objects
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new('/api/upload', headers)
    request.body = data.to_json

    # Send the request
    begin
      response = http.request(request)
      puts response.body
    rescue Exception => e
      puts "Error get data: ", e
    end
  end

  def self.upload_with_retry(index)
    puts "[#{Time.new}] Start post file #{index}"
    
    uri = URI.parse(ENDPOINT)

    headers = { 'Content-Type': 'application/json', token: TOKEN }
    data = {
      client: 'ruby',
      name: "file #{index}",
      file: 'content',
      size: index
    }

    # Create the HTTP objects
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new('/api/upload', headers)
    request.body = data.to_json

    # Send the request
    begin
      response = http.request(request)
      if response.code == '429'
        number_seconds = response['retry-after'].to_i + 1
        puts "[#{index}] Wait for limit time: #{number_seconds}"

        sleep number_seconds
        response = http.request(request)
      end
      puts response.body
    rescue Exception => e
      puts "Error get data: ", e
    end
  end
end
