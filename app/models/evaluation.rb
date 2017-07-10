class Evaluation < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  validates :user, uniqueness: { scope: :post }
end

class UniqueEvaluation < ActiveModel::Validator
  def validate(record)
    if record.like && record.dislike
      record.errors.add :base, "You can't like and dislike at the same time"
    end
  end
end