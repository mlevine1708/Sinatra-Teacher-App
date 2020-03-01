require './config/environment'

class StudentsController < ApplicationController
  
  #CRUD 
  get '/students' do
    @students = Students.all 
    erb :'students/index'
  end 

  #CREATE
  #render a form to create a new student 
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
  
  #READ 
  # index route for all students 
  
  #show route for a single student 
  get '/students/:id' do
    @student = Students.find(params[:id])
    erb :"/students/show"
  end
  
  #UPDATE
  get '/students/:id/edit' do
    @student = Student.find(params[:id])
    if authorized_to_edit?(@student)
      erb :'/students/edit'
    else
      flash[:error] = "Not authorized to edit that student."
      redirect "/students"
    end
  end 
  #DELETE 
  
  patch '/students/:id' do
    @student = Student.find(params[:id])
    @student.update(name: params[:name], grade_level: params[:grade_level])
    redirect "/students/#{@student.id}"
  end 

end

  
