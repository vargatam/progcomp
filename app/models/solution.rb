class Solution < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user
  attr_accessible :is_correct, :score, :solution
end
