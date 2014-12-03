class ApplicationController < Sinatra::Base
  helpers ApplicationHelper
  enable :logging
  enable :raise_errors

  configure :test do
    ActiveRecord::Base.logger = nil
  end

  configure :production do
    Airbrake.configure do |config|
      config.api_key = 'f13597f5bb541d297c4056299658b501221640b5'
    end
    use Airbrake::Sinatra
  end
  before do
    content_type :json
  end

  get '/' do
    raise 'Sinatra has left the room'
    ENV['RACK_ENV']
  end
end
