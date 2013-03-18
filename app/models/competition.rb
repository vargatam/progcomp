class Competition < ActiveRecord::Base
  attr_accessible :end_time, :name, :start_time
  has_many :teams, :dependent => :destroy
  has_many :problems, :dependent => :destroy

  def default
    #returns the closest competition that has not ended yet
    comps = Competition.all
    comps.sort_by! {|comp| comp.end_time }
    now = Time.now
    comps.each do |comp|
      return comp if comp.end_time > now
    end
  end
  def header_problems
    pbs = problems
    pbs.delete_if {|pb| not pb.parent_id.nil?}
    return pbs.sort_by {|pb| pb.number }
  end
end
