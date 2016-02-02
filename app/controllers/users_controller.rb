class UsersController < ApplicationController
  before_action :authenticate_user!, only: :secret_page
  before_action :load_user, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: t('shared.created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: t('shared.updated')
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = t('shared.destroyed')
    else
      flash[:alert] = t('shared.not_destroyed')
    end
    redirect_to users_url
  end

  def test_page
  end

  def secret_page
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :phone, :status)
  end
end
