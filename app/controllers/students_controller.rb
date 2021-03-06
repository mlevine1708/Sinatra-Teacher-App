require './config/environment'

class StudentsController < ApplicationController
  
  get '/students' do
    @students = Students.all 
    erb :'students/index'
  end 

  get "students/new" do
    if logged_in?
      erb :"users/show"
    else 
      flash[:error] = "You must be logged in to add to your student list."
      redirect "/"
    end 
  end 
  
  post "/students" do 
    student = Students.new(name: params[:name], grade_level: params[:grade_level], user_id: current_user.id)
    if student.save
      flash[:message] = "Successfully created student!"
      redirect "/students/#{student.id}"
    else
      flash[:error] = "Student creation failed..."
      redirect "/students/create"
    end 
  end 
  
  
  get '/students/:id' do
    @student = Students.find(params[:id])
    erb :"/students/show"
  end
  
  get '/students/:id/edit' do
    @student = Students.find(params[:id])
    if authorized_to_edit?(@student)
      erb :'/students/edit'
    else
      flash[:error] = "Not authorized to edit that student."
      redirect "/students"
    end
  end 
  
  patch '/students/:id' do
    @student = Students.find(params[:id])
    @student.update(name: params[:name], grade_level: params[:grade_level])
    redirect "/students/#{@student.id}"
  end 

  delete '/students/:id' do
    @student = Students.find(params[:id])
    if logged_in? && @student.user == current_user
      @student.destroy
      redirect to('/students')
    else
      redirect to('/login')
    end
  end
end

  
