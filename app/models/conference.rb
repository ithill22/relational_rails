class Conference < ApplicationRecord
  has_many :teams 

  def self.order_by_created_at
    order(created_at: :asc)
  end

  def number_of_teams
    teams.size
  end
end