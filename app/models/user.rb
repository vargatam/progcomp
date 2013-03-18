class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable :recoverable :validatable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable

  has_one :team_member, :dependent => :destroy
  has_one :team, :through => :team_member
  has_many :solutions
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  validates :email, :presence => true, :uniqueness => {:case_sensitive => false, :allow_blank => false}, :if => :email_changed?
  validates :password, :presence => true, :confirmation => true, :on=>:create

  def is_admin?
    email == 'vargat@elte.hu' || email == 'bartmate'
  end
  def self.all_without_team
    User.all.delete_if{|usr| not usr.team.nil?}.map{|usr| usr.email}
  end
end
