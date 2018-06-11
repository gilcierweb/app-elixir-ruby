require 'sinatra'

configure do
  set :server, :puma
  # set :database_file, 'config/database.yml'
  set :erb, :layout => :'layouts/application.html'
end

get '/' do
  @repos = Repository.all
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