class Users::ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end
end
