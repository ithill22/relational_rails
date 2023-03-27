class TeamsController < ApplicationController
  def index
    @teams = Team.all.private_true
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to "/teams/#{team.id}"
  end

  private
    def team_params
      params.require(:team).permit(:school_name, :mascot, :private, :rank)
    end
end