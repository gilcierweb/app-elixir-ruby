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

get '/show/:id' do
  @repository = Repository.find(params[:id])
  erb :'home/show.html'
end

get '/search' do
  query = params['q'].to_s
  api_result = RestClient.get "https://app-elixir.herokuapp.com/search?q=#{query}"
  @results = JSON.parse(api_result)
  save_repositories(@results['items'])
  erb :'home/search.html'
end

def save_repositories(data)
  data.each do |row|
    row_data = {user: row['name'], repository: row['full_name'], url: row['url'], language: row['language']}
    Repository.create(row_data)
  end
end