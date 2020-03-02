class AssignmentsController < ApplicationController
  
  get '/assignments' do
    @assignments = Assignments.all 
    erb :'assignments/index'
  end 

  get "assignments/new" do
    if logged_in?
      erb :"users/show"
    else 
      flash[:error] = "You must be logged in to add to your assignment list."
      redirect "/"
    end 
  end 
  
  post "/assignments" do 
    assignment = Assignments.new(title: params[:title], subject: params[:subject], user_id: current_user.id)
    if assignment.save
      flash[:message] = "Successfully created assignment!"
      redirect "/assignments/#{assignment.id}"
    else
      flash[:error] = "Assignment creation failed..."
      redirect "/assignments/create"
    end 
  end 
  
  get '/assignments/:id' do
    @assignment = Assignments.find(params[:id])
    erb :"/assignments/show"
  end
  
  get '/assignments/:id/edit' do
    @assignment = Assignments.find(params[:id])
    if authorized_to_edit?(@assignment)
      erb :'/assignment/edit'
    else
      flash[:error] = "Not authorized to edit that assignment."
      redirect "/assignments"
    end
  end 
  
  patch '/assignment/:id' do
    @assignment = Assignments.find(params[:id])
    @assignment.update(title: params[:title], subject: params[:subject])
    redirect "/assignments/#{@assignment.id}"
  end 

  delete '/assignments/:id' do
    @assignment = Assignments.find(params[:id])
    if logged_in? && @assignment.user == current_user
      @assignment.destroy
      redirect to('/assignments')
    else
      redirect to('/login')
    end
  end
  
end
