class ProjectsController < ApplicationController

  before_action :find_project, only: [:edit, :update, :destroy]
  before_action :find_user, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :"authenticate!", only: [:index, :new, :create, :edit, :update, :destroy]


  def index
    # authenticate!
    if (authenticated?(@user.id))
      @projects = Project.where(user_id: @user.id)
    else
      redirect_to root_path
  end

  end

  def all
    @projects = Project.all.sort_by{|project| project.mod_created}.reverse
  end

  def new
    # authenticate!
    if (authenticated?(@user.id))
      @project = Project.new
      @cohorts = Cohort.all
    else
      flash.now[:message] = "You can only create projects on your profile."
      redirect_to @user
    end
  end

  def create

    # authenticate!
      @project = Project.new(project_params)
      @user.projects << @project
      if (authenticated?(@user.id)) && @project.save
        flash.now[:message] = "New Project Successfully Create!"
        redirect_to user_projects_path(@user)
      else
        flash.now[:error] = @project.errors.full_messages
        render :new
      end
  end


  def edit
    # authenticate!
    if (authenticated?(@user.id))
      @cohorts = Cohort.all
    else
      flash.now[:message] = "You can only edit projects on your profile."
      redirect_to @user
    end
  end

  def update
    # authenticate!
    if (authenticated?(@user.id)) && @project.update(project_params)
      flash.now[:message] = "Your edit was saved."
      redirect_to user_projects_path(user_id: @user, id: @project)
    else
      flash.now[:error] = @project.errors.full_messages
      render :edit
    end
  end

  def destroy
    # authenticate!
    if (authenticated?(@user.id))
      @project.destroy
      redirect_to user_projects_path
    else
      flash.now[:message] = "You can only delete projects on your profile."
      redirect_to @user
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :mod_created, :github_link, :image_url)
  end

  def find_user
    @user = User.find(params[:user_id])
  end


end
