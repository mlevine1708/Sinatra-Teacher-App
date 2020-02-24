require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "teacherapp"
  end

  get "/" do
    erb :welcome
  end


  get "/signup" do
    erb :signup
  end

  post '/signup' do
    @users = User.new(name: params["name"], email: params["username"], password: params["password"])
    @users.save
    session[:user_id] = @users.id

    redirect '/account'
  end

  get '/account' do
    @users = User.find_by(username: params[:username])
    erb :account
  end


  get "/login" do
    erb :login
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/account"
    else
      redirect to "/failure"
    end
  end
  
  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect "/"
  end
  
end
