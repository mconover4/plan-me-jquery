class CommentsController < ApplicationController
  before_action :set_trip

  def index
    @comments = @trip.comments
    # It went to implicit rendering
    # render :layout => false
    # render :json => @comments
    # render :layout => false
    respond_to do |format|
      format.html {render 'index.html', :layout => false}
      format.js {render 'index.js', :layout => false}
    end
  end

  def create
    @comment = @trip.comments.build(comments_params)
    if @comment.save
      # I need to render something that just has the LI I want...
      # why not just create a comments/show view that shows the LI of one comment?
      # render 'comments/show', :layout => false
      render 'create.js', :layout => false
    else
      render "trips/show"
    end
  end


  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def comments_params
      params.require(:comment).permit(:content, :user)
    end
end
