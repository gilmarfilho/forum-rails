class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :evaluations
  has_and_belongs_to_many :tags

  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end

  after_create do
    hashtags = self.content.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      self.tags << tag
    end
  end

  before_update do
    self.tags.clear
    hashtags = self.content.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      self.tags << tag
    end
  end

end
