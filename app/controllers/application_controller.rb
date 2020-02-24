require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end
  
  get "/signup" do
    erb :signup
  end

  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect '/failure'
    else
      Users.create(username: params[:username], password: params[:password])
      redirect '/login'
    end

  end

  get '/account' do
    @user = Users.find_by(username: params[:username])
    erb :account
  end


  get "/login" do
    erb :login
  end

  post "/login" do
    @user = Users.find_by(username: params[:username])
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
  
  
    helpers do
  
      def logged_in?
        !!session[:user_id]
      end
  
      def current_user
        Users.find(session[:user_id])
      end
    
    end

end
