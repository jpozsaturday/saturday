require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/login' do
  @username = params[:username]
  @password = params[:password]
  if @username == 'jpoz'
    if @password == 'taco'
      redirect "/name?name=jpoz&state=Oregon"
    else
      @error = "Wrong Password"
      erb :index
    end
  else
    @error = "Wrong username"
    erb :index
  end
end

get '/name' do
  @name = (params[:name] || "Nobody").downcase
  @state = params[:state]
  if @name == "collin"
    redirect 'http://www.youtube.com/watch?v=oHg5SJYRHA0'
  else
    erb :name
  end
end
