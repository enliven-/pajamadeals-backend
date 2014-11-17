require_relative 'config/initializers/setup_db_connection'
require 'sinatra/activerecord/rake'
require 'rake/testtask'

# unit test tasks
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb', 'test/test_helper.rb']
end