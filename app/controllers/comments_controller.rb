class CommentsController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    #if @comment.save
     # render :partial => "comments/comment", locals: { comment: @comment }, layout: false, status: :created
    #else
     # render :js => "alert('error saving comment');"
    #end
    respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.js 
    end    
  end
  
  def index
  end
  
  def destroy
    #@comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
      if @comment.destroy
        #redirect_to post_path(@post)
        render :json => @comment, :status => :ok
      else
        render :js => "alert('error deleting comment');"
      end
  end

private
  
  def comment_params
      params.require(:comment).permit(:commentable_id, :commentable_type, :user_id, :comment)
  end

end
