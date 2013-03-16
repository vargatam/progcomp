class Competition < ActiveRecord::Base
  attr_accessible :end_time, :name, :start_time
  has_many :teams
  has_many :problems
end
