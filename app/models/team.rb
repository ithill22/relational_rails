class Team < ApplicationRecord
  belongs_to :conference

  def self.private_true
    where(private: true)
  end

  def team_order(params)
    teams.order(param[:order_by])
  end
end