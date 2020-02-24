class UsersController < ApplicationController
  
  
  get '/signup' do
    if !session[:user_id]
      erb :'signup'
    else
      redirect to ('/students')
    end 
  end 
  
  post '/signup' do
    @users = User.new(name: params["name"], username: params["username"], password: params["password"])
    @users.save
    session[:user_id] = @users.id

    redirect '/account'
  end

  
  
  get '/login' do
    if !session[:user_id]
      erb :'/login'
    else
      redirect to '/students'
    end
  end 
  
  post '/login' do
    @user = Users.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/students/create'
    else
      @errors = "Invalid username or password."
      erb :'/login'
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