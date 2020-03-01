require './config/environment'

class StudentsController < ApplicationController
  
  #CRUD 
  
  #READ 
  # index route for all students 
  get '/students' do
    @students = Students.all 
    erb :'students/index'
  end 
  
  #show route for a single student 
  get '/students/:id' do
    @students = Student.find(params[:id])
    erb :"/students/show"
  end
  #CREATE
  
  #UPDATE
  
  #DELETE 
end

  
