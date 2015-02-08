class User < ActiveRecord::Base
  default_scope { order("first_name") }
  enum role: [:admin, :regular]
  after_initialize :set_default_role, :if => :new_record?

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
  
  def set_default_role
    self.role ||= :regular
  end
end
