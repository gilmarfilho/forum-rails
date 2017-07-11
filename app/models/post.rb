class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :evaluations
  
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  
  def self.search(search)
    where("title LIKE ?", "%#{search}%") 
  end
end
