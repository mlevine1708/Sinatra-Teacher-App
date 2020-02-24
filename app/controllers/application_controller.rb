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


  
  get '/account' do
    @users = User.find_by(username: params[:username])
    erb :account
  end
  
  helpers do 

    def self.current_user(session)
      @user = User.find_by_id(session[:user_id])
    end

    def self.is_logged_in?(session)
      !!session[:user_id]
    end
  end

  
end
