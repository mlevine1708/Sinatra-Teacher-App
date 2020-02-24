require './config/environment'

class StudentController < Sinatra::Base
  
  get '/students' do
    if logged_in?
      @student = current_user.students
      erb :'/students'
    else 
      redirect to('/login')
    end
  end
  
  
  
  
  
  
end 
