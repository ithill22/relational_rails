class Conferences::TeamsController < ApplicationController
  def index
    @conference = Conference.find(params[:conference_id])
    
  end
end