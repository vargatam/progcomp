class Team < ActiveRecord::Base
  belongs_to :competition
  has_many :team_members, :dependent => :destroy
  has_many :users, :through => :team_members
  has_many :solutions, :through => :team_members
  attr_accessible :name, :number
end
