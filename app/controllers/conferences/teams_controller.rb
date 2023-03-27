class Conferences::TeamsController < ApplicationController
  def index
    @conference = Conference.find(params[:conference_id])
  end

  def new
    @team = Team.new
  end
end