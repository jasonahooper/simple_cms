class SubjectsController < ApplicationController

  def index
    list
	render('list')
  end
  
  def list
    @subjects = Subject.order("subjects.position ASC")
  end
  
  def show
    @subject = Subject.find(params[:id])
  end
  
  def new
    @subject = Subject.new
  end
  
  def create
    # instantiate a new object using form parameters
	@subject = Subject.new(params[:subject])
	# save the object
	if @subject.save
	  # if save succeeds, redirect to the list action
	  flash[:notice] = "Subject created."
	  redirect_to(:action => 'list')
	else
	  # if save fails, redisplay the form so user can fix problems
	  render('new')
	end
  end
  
  def edit
    @subject = Subject.find(params[:id])
  end
  
  def update
    # find object using form parameters
	@subject = Subject.find(params[:id])
	# update the object
	if @subject.update_attributes(params[:subject])
	  # if update succeeds, redirect to the list action
	  flash[:notice] = "Subject updated."
	  redirect_to(:action => 'show', :id => @subject.id)
	else
	  # if save fails, redisplay the form so user can fix problems
	  render('edit')
	end
  end
  
  def delete
    @subject = Subject.find(params[:id])
  end
  
  def destroy
    Subject.find(params[:id]).destroy
	flash[:notice] = "Subject destroyed."
	redirect_to(:action => 'list')
  end
end
