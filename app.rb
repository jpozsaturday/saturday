require 'sinatra'
require 'sinatra/reloader'
require 'json'

enable :sessions

get '/' do
  erb :index
end

post '/login' do
  @username = params[:username]
  @password = params[:password]
  if @username == 'jpoz'
    if @password == 'banana'
      session[:user] = 'jpoz'
      redirect '/secrets'
    else
      @error = "Hey dude you got the password wrong"
      erb :index
    end
  else
    @error = "Wrong username"
    erb :index
  end
end

get '/secrets' do
  return redirect '/' unless session[:user] == 'jpoz'
  "Waffle"
end

get '/logout' do
  session[:user] = nil
  redirect '/'
end
