require 'rubygems'
require 'bundler'
Bundler.require
require 'sinatra/json'
require 'carrierwave/orm/activerecord'
require 'mandrill'

ENV['RACK_ENV'] ||= 'development'

Dir.glob('./{config/initializers,lib,app/uploaders,app/helpers,app/controllers,app/models}/*.rb').each do |file|
  require file
end

map('/') { run ApplicationController }
map('/listings') { run ListingsController }
map('/books') { run BooksController }
map('/orders') { run OrdersController }
