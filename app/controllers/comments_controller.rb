class CommentsController < ApplicationController
  before_action :set_trip

  def index
    @comments = Comment.all
    render json: @comments
  end

  #def index
  #  @comments = @trip.comments
  #  respond_to do |format|
  #    format.html {render 'index.html', :layout => false}
  #    format.js {render 'index.js', :layout => false}
  #  end
  #end

  def create
    @comment = Comment.create(comments_params)
    render json: @comment, status: 201
  end

  #def create
  #  @comment = @trip.comments.build(comments_params)
  #  if @comment.save
  #    redirect_to @trip
  #  else
  #    render "trips/show"
  #  end
  #end

 def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
   render json: @comment
 end


  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def comments_params
      params.require(:comment).permit(:id, :content, :trip_id, :user_id)
    end
end
