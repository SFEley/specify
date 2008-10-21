class PagesController < ApplicationController
  def show
    if params[:id]
      @page = Page.find(params[:id])
    else # Special case of root URL
      @page = Page.root
      redirect_to (:action => "new") unless @page
    end
  end
end
