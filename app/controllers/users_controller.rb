class UsersController < ApplicationController
  before_action :find_user, only: :show
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Ekohe! Nice to meet you!"
      redirect_to @user
    else
      render :new
    end
  end

  private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
