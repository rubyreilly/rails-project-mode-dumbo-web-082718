class ProjectsController < ApplicationController

  before_action :find_project, only: [:edit, :update, :destroy]
  before_action :find_user, only: [ :new, :create, :edit, :update, :destroy]


  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @cohorts = Cohort.all 
  end

  def create
    @project = Project.new(project_params)
    if @project.valid?
      @project.save

      # UserProject.create(user:project_params[:user_ids])
      redirect_to projects_path
    else
      flash.now[:error] = @project.errors.full_messages
      render :new
    end
  end


  def edit
    @cohorts = Cohort.all
  end

  def update
    @project.update(project_params)
    if @project.valid?
      redirect_to @project
    else
      flash.now[:error] = @project.errors.full_messages
      render :edit
    end
  end

  def destroy

    @project.destroy
    redirect_to user_projects_path
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :mod_created, :github_link)
  end

  def find_user
    @user = User.find(params[:user_id])
  end


end
