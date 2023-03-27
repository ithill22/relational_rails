class Conference < ApplicationRecord
  has_many :teams 

  def self.order_by_created_at
    order(created_at: :asc)
  end

  def number_of_teams
    teams.size
  end

  def team_order(order)
    teams = self.teams
    teams = teams.order(:school_name) if order == 'a-z'
    teams
  end
end