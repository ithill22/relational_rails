class Team < ApplicationRecord
  belongs_to :conference

  def self.private_true
    where(private: true)
  end
end