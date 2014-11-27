class ApplicationController < Sinatra::Base
  helpers ApplicationHelper
  enable :logging

  configure :test do
    ActiveRecord::Base.logger = nil
  end

  before do
    content_type :json
  end

  get '/' do
    'application ' + self.object_id.to_s
  end
end
