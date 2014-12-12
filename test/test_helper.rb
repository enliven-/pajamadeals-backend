ENV['RACK_ENV'] = 'test'
require 'rubygems'
require 'bundler'
require 'minitest/autorun'
require 'minitest/reporters'
require 'database_cleaner'
require 'sinatra/json'
# require 'minitest/pride'
# require 'minitest/emoji'

Bundler.require(:default, :test)
require 'carrierwave/orm/activerecord'

Dir.glob('./{config/initializers,app/uploaders,lib,app/helpers,app/controllers,app/models}/*.rb').each do |file|
  require file
end

FactoryGirl.definition_file_paths = %w{./factories ./test/factories}
FactoryGirl.find_definitions
Minitest::Reporters.use!

class MiniTest::Test
  include Rack::Test::Methods
  include FactoryGirl::Syntax::Methods
  I18n.enforce_available_locales = false

  def before_setup
    DatabaseCleaner.strategy = :truncation, { pre_count: true }
    DatabaseCleaner.clean
  end
end
