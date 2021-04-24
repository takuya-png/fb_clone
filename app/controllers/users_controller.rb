class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  def new
    @user = User.new
  end

  def show
  end
  
  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    else
      if @user.save
        redirect_to user_path(@user.id), notice: "ユーザー登録しました"
      else
        render :new
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
