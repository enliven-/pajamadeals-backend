ENV['RACK_ENV'] = 'test'
require 'rubygems'
require 'bundler'
require 'minitest/autorun'
require 'minitest/reporters'
# require 'minitest/pride'
# require 'minitest/emoji'

Bundler.require(:default, :test)

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

end

class MiniTest::Spec
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end

end
