class TeamMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  has_many :solutions, :through => :user
end
