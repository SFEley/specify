class PagesController < ApplicationController
  def show
    if params[:id]
      @page = Page.find(params[:id])
    else # Special case of root URL
      @page = Page.root
      redirect_to(:action => "new") unless @page
    end
  end
  
  def new
    # Right now just implementing the root case; we'll change this to "if" later
    unless params[:id]
      if Page.root # Sanity check to make sure we only have one root page
        flash[:error] = "You cannot create a new root page!"
        redirect_to("/")
      else
        @page = Page.new
      end
    end
  end
      
end
