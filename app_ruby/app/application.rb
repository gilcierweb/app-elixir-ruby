require 'sinatra'
require "sinatra/activerecord"
require 'rest-client'

# Load up all models next
Dir[File.dirname(__FILE__) + "/models/*.rb"].each do |file|
  require file
end

configure do
  set :server, :puma
  # set :database_file, 'config/database.yml'
  set :erb, :layout => :'layouts/application.html'
end

get '/' do
  @repositories = Repository.all
  erb :'home/index.html'
end

post '/' do
#   .. create something ..
end

put '/' do
#   .. replace something ..
end

patch '/' do
#   .. modify something ..
end

delete '/' do
#   .. annihilate something ..
end

get '/show/:name' do
  api_result = RestClient.get 'https://api.github.com/users/gilcierweb/repos'
  @result = JSON.parse(api_result)
  erb :'home/show.html'
end