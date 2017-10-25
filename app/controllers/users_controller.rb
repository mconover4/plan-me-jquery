class UsersController < ApplicationController

  def index
    @users = User.all
    @planners = User.planner
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def edit
    if current_user.id == session[:user_id]
      @user = User.find(params[:id])
    else
      flash[:notice] = "Access Denied."
      redirect_to users_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
	   @user = User.find(params[:id])
     authorize @user
  	 @user.assign_attributes(user_params)
     if @user.save
		   redirect_to user_path(@user)
     else
       flash[:notice] = "Access Denied."
       redirect_to users_path
     end
	end

  private

    def user_params
      params.require(:user).permit(:id, :name, :email, :password, :personality, :reason, :international, roles: [])
    end

end
