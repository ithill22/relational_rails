class Conferences::TeamsController < ApplicationController
  def index
    @conference = Conference.find(params[:conference_id])
    @teams = @conference.find_teams(params)
    # require 'pry'; binding.pry
  end

  def new
    @conference = Conference.find(params[:conference_id])
    @team = @conference.teams.new
  end

  def create
    conference = Conference.find(params[:conference_id])
    conference.teams.create(team_params)
    redirect_to "/conferences/#{conference.id}/teams"
  end

  private
    def team_params
      params.require(:team).permit(:school_name, :mascot, :private, :rank)
    end
end