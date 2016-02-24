module CommentsHelper

  def return_child_comments id
    child_comments = Comment.where(:parent_id => id)

    if child_comments.present?
      child_comments
    else
      nil
    end
  end

  def return_child_comment_count id

    child_comments = Comment.where(:parent_id => id).count()

    if child_comments.present?
      child_comments
    else
      nil
    end
  end

  def return_child_comment_count_by_task id
    child_comments = Comment.where(:product_id => id).count()
    if child_comments.present?
      child_comments
    else
      nil
    end
  end

  def return_comment_count product_id
    comment_cnt = Comment.where(:product_id => product_id).count()

    if comment_cnt > 0
      comment_cnt
    else
      nil
    end
  end

end