class Problem < ActiveRecord::Base
  belongs_to :competition
  belongs_to :parent, :class_name => "Problem"
  has_many :subproblems, :class_name => "Problem", :foreign_key => "parent_id"
  has_many :solutions
  attr_accessible :number, :point, :solution, :solution_type, :text, :title
end
