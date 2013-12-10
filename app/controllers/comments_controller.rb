class CommentsController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        format.json { render action: 'show', status: :created, location: @post }
        format.js
      else
        format.html { redirect_to post_path(@post), notice: 'comment not saved, comment was empty...' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end    
  end
  
  def index
  end
  
  def destroy
    #@comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.js
      else
        render :js => "alert('error deleting comment');"
      end
    end
  end

private
  
  def comment_params
      params.require(:comment).permit(:user_id, :post_id, :body)
  end

end
