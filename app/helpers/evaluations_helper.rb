module EvaluationsHelper
  # Gets the amount of likes for a post
  def likes(post)
    Evaluation.where(post_id: post.id, user_id: post.user, like: true).count
  end
  
  # Gets the amount of dislikes for a post
  def dislikes(post)
    Evaluation.where(post_id: post.id, user_id: post.user, dislike: true).count
  end
  
  # User can like?
  def already_liked(post)
    Evaluation.exists?(post_id: post.id, user_id: current_user, like: true)
  end
  
  # User can dislike?
  def already_disliked(post)
    Evaluation.exists?(post_id: post.id, user_id: current_user, dislike: true)
  end
end
