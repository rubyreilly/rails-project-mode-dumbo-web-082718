class CohortsController < ApplicationController

  def index
    Cohort.increment_mod
    @cohorts = Cohort.all
  end

  def show
    Cohort.increment_mod
    @cohort = Cohort.find(params[:id])
    @users = @cohort.users
  end
end
