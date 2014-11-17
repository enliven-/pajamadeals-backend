class ApplicationController < Sinatra::Base
  helpers ApplicationHelper
  enable :logging
  enable :sessions

  get '/' do
    'application ' + self.object_id.to_s
  end
end
