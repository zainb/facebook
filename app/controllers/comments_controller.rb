class CommentsController < ApplicationController
	def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    #@comment.save
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { redirect_to post_path(@post), notice: 'comment not saved, comment was empty...' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def index
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

private
  
  def comment_params
      params.require(:comment).permit(:post_id, :user_id, :body)
  end

end
