class UsersController < ApplicationController
  
  get '/login' do
    #if !session[:user_id]
      erb :'/login'
    #else
     # redirect to '/students'
    #end
  end 
  
  post '/login' do
    user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        binding.pry
      else
      redirect '/login'
      end 
  end 
  
  get '/users/show' do
    erb :'users/show'
  end
  
  get '/logout' do
    if logged_in?
      @user = current_user
      @user = nil 
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
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