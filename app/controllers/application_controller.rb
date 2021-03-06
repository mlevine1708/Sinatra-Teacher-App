require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "teacherapp"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else 
      erb :welcome
    end 
  end


  
  get '/account' do
    @users = User.find_by(username: params[:username])
    erb :account
  end
  
  helpers do 
    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end
    
    def authorized_to_edit?(student)
      student.user == current_user
    end 
    
  end

  
end
