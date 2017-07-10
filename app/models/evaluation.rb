class Evaluation < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :user
  belongs_to :post
  
  validates :user, uniqueness: { scope: :post }
  
  def cannot_like_and_dislike(record)
    if like && dislike
      record.errors.add :base, "You can't like and dislike at the same time"
    end
  end
end
