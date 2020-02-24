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
  
  
  helpers do

    def current_user
      @current_user ||= Users.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

end
