class Problem < ActiveRecord::Base
  belongs_to :competition
  belongs_to :parent, :class_name => "Problem"
  has_many :subproblems, :class_name => "Problem", :foreign_key => "parent_id", :dependent => :destroy
  has_many :solutions
  attr_accessible :number, :point, :solution, :solution_type, :text, :title, :parent_id
  def total_points
    pt = point
    subs = subproblems
    subs.each do |sub|
      pt += sub.point
    end
    return pt
  end
  def parent_top
    p = self
    until p.parent.nil?
      p = p.parent
    end
    return p
  end
end
