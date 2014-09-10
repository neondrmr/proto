module CommentsHelper
  
  def is_comment_owner? (comment)
    current_user.id == comment.user_id
  end
  
  
end
