class ConferencesController < ApplicationController
  def index
    @conferences = Conference.all
    @conferences = Conference.order_by_created_at
  end

  def show
    @conference = Conference.find(params[:id])
  end
end
