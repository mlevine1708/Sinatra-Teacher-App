require './config/environment'

class StudentsController < ApplicationController
  
  #CRUD 
  

  #CREATE
  #render a form to create a new student 
  get "students/create" do
    erb :"students/create"
  end 
  
  post "/students" do 
    student = Student.create(name: params[:name], grade_level: params[:grade_level], user_id: current_user.id)
    redirect "/students/#{student.id}"
  end 
  
  #READ 
  # index route for all students 
  get '/students' do
    @students = Students.all 
    erb :'students/index'
  end 
  
  #show route for a single student 
  get '/students/:id' do
    @student = Student.find(params[:id])
    erb :"/students/show"
  end
  
  #UPDATE
  
  #DELETE 
end

  
