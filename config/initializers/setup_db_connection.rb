require 'yaml'
require 'active_record'

env = ENV["RACK_ENV"] || "development"

DB_CONFIG = YAML::load(File.open(File.expand_path('../../database.yml', __FILE__)))[env]

ActiveRecord::Base.establish_connection(
  adapter:  DB_CONFIG['adapter'],
  host:     DB_CONFIG['host'],
  database: DB_CONFIG['database'],
  encoding: DB_CONFIG['encoding'],
  username: DB_CONFIG['username'],
  password: DB_CONFIG['password']
)
