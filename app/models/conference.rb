class Conference < ApplicationRecord
  has_many :teams 

  def self.order_by_created_at
    order(created_at: :asc)
  end

  def number_of_teams
    teams.size
  end

  def find_teams(params)
    if !params[:order_by].nil?
      team_order(params)
    elsif !params[:rank].nil?
      teams_by_rank(params)
    else
      teams
    end
  end
  def team_order(params)
    teams.order(params[:order_by])
  end

  def teams_by_rank(params)
    teams.where('rank > ?', params[:rank])
  end
end