class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :bookings, dependent: :destroy
  validates_presence_of :first_name, :last_name


  def is_admin?
  	role_id == Role.find_by_name('admin').id
  end

  def full_name
  	"#{first_name}" + ' ' + "#{last_name}"
  end
end
