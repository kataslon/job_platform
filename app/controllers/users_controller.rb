class UsersController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def show
  end

  def index
    @users_grid = initialize_grid(User)
  end

  def edit
  end

  def update
    @user.set_role(user_params)
    if @user.save
      flash[:success] = "User updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_path
  end

  protected

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :admin, :company_owner, :manager, :applicant)
    end
end
