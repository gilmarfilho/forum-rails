class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :sex, presence: true
  validates :nameUsers, presence: true
  validates :birthDate, presence: true
  validates :aboutYou, length: { maximum: 200 }
  
  has_many :posts
  has_many :evaluations
  has_many :comments, through: :posts
end
