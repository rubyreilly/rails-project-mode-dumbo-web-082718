class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @projects = @user.projects
    @cohort = @user.cohort

  end

  def new
    @user = User.new
    @cohorts = Cohort.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user(@user.id)
      flash[:message] = "You are registered!"
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @cohorts = Cohort.all
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    log_out!
    @user.destroy
    redirect_to new_session_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:cohort_id, :first_name, :last_name, :username, :password, :image_url, :github_link)
  end

end
