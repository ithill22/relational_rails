class ConferencesController < ApplicationController
  def index
    @conferences = Conference.all.order_by_created_at
  end

  def show
    @conference = Conference.find(params[:id])
  end

  def new
    @conference = Conference.new
  end

  def create
    conference = Conference.create(conference_params)
    redirect_to '/conferences'
  end

  def edit
    @conference = Conference.find(params[:id])
  end

  private
    def conference_params
      params.require(:conference).permit(:name, :region, :power_five, :national_champions)
    end
end
