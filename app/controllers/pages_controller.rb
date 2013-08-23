class PagesController < ApplicationController

  def index
    list
	render('list')
  end
  
  def list
    @pages = Page.order("pages.position ASC")
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def new
    @page = Page.new
  end
  
  def create
    # instantiate a new object using form parameters
	@page = Page.new(params[:page])
	# save the object
	if @page.save
	  # if save succeeds, redirect to the list action
	  flash[:notice] = "Page created."
	  redirect_to(:action => 'list')
	else
	  # if save fails, redisplay the form so user can fix problems
	  render('new')
	end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    # find object using form parameters
	@page = Page.find(params[:id])
	# update the object
	if @page.update_attributes(params[:page])
	  # if update succeeds, redirect to the list action
	  flash[:notice] = "Page updated."
	  redirect_to(:action => 'show', :id => @page.id)
	else
	  # if save fails, redisplay the form so user can fix problems
	  render('edit')
	end
  end
  
  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    Page.find(params[:id]).destroy
	flash[:notice] = "Page destroyed."
	redirect_to(:action => 'list')
  end
end
