class ApplicationController < Sinatra::Base
  helpers ApplicationHelper
  enable :logging
  enable :raise_errors

  configure :test do
    ActiveRecord::Base.logger = nil
  end
  
  configure :production do
    Airbrake.configure do |config|
      config.api_key = "c6b1addaa8d0cea0da8b61cfdb27f76e6cb855af"
    end
    use Airbrake::Sinatra
  end
  

  before do
    content_type :json
  end

  get '/' do
    begin
      raise 'Sinatra has left the room'
    rescue Exception => e
      Airbrake.notify e
    end
    ENV['RACK_ENV']
  end
end
