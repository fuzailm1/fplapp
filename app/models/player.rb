class Player < ApplicationRecord
  has_many :oppositions
  belongs_to :team, foreign_key: 'team_id'
end
