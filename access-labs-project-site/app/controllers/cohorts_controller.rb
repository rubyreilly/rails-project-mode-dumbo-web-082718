class CohortsController < ApplicationController

  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
    @users = @cohort.users
  end
end
