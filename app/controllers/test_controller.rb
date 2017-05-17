class TestController < ApplicationController

  def index
    @recipient = '0727686700'
    @message   = 'Hello from Ruby on Rails 5'

    render json: create_file(@recipient, @message)
  end


  private
    def create_file(recipient, message)
      path    = ENV['SMS_PATH']
      message = "To: #{ recipient } \n\n#{ message }"
      timestamp = Time.now.strftime('%S-%M-%H-%Y-%d-%m')

      out_file = File.new("#{ path }/#{ timestamp }-#{ recipient }", 'w')
      out_file.puts(message)
      out_file.close

      return {
        recipient: recipient,
        message: message,
        timestamp: timestamp
      }
    end

end
