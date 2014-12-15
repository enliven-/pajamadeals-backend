class ApplicationController < Sinatra::Base
  helpers ApplicationHelper
  enable :logging
  enable :raise_errors
  # set :protection, origin_whitelist: ["http://www.pajamadeals.in",
#                                       "http://pajamadeals.in",
#                                       "http://localhost:9393"]

  set :protection, except: [:json_csrf]
  
  register Sinatra::CrossOrigin
  register Sinatra::JsonBodyParams

  configure :test do
    ActiveRecord::Base.logger = nil
  end

  configure :production do
    enable :cross_origin
    
    Airbrake.configure do |config|
      config.api_key = 'ad611d7eb53d2966bf69f90fedb523be'
    end
    use Airbrake::Sinatra
  end

  # cross origin request configuration  
  set :allow_origin, :any
  set :allow_methods, [:get, :post, :options]
  set :allow_credentials, true
  set :max_age, "1728000"
  set :expose_headers, ['Content-Type']

  before do
    # request.url =~ /^https?:\/\/([\da-z\.-]+)?pajamadeals\.in/)
    # unless ENV['RACK_ENV'] == 'test' || ENV['RACK_ENV'] == 'development' || \
    #                       (ENV['RACK_ENV'] == 'production' &&
    #                        request.url =~ /^https?:\/\/(wwww.)?pajamadeals\.in/)
    #   halt 403, "403 Forbidden Entry.\n “I’m sorry. I know who you are–I believe
    #              who you say you are–but you just don’t have permission to
    #              access this resource. Maybe if you ask the system administrator
    #              nicely, you’ll get permission. But please don’t bother me again
    #              until your predicament changes."
    # end
    content_type :json
  end

  get '/' do
    "Hello!"
  end
end
