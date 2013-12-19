class CommentsController < ApplicationController

	# POST /posts/1/comments
  def create
    @post = Post.find params[:post_id] 
    @comment = @post.comments.create comment_params 
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js
      else
        format.js { render :js => "alert(\"comment can't be empty\");"}
      end
    end    
  end
  
  #DELETE /posts/1/comments/1
  def destroy
    post = Post.find params[:post_id]
    @comment = post.comments.find params[:id] 
    respond_to do |format|
      if @comment.destroy
        format.js
      else
        format.js { render :js => "alert('error deleting comment');"}
      end
    end
  end

private
  
  def comment_params
      params.require(:comment).permit(:user_id, :post_id, :body)
  end

end
