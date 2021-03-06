class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  
  # GET /posts
  def index
    @my_posts = Post.where user_id: current_user 
    @friends_posts = Post.where user_id: current_user.friends
    @post = Post.new
  end

  # GET /posts/1
  def show
    @comments = @post.comments
  end

  # POST /posts
  def create
    @post = current_user.posts.create post_params 
    respond_to do |format|
      if @post.save
        format.js
      else
        format.js { render js: "alert('Post could not be created');" }
      end
    end
  end

  #DELETE /posts/1
  def destroy
    @post.destroy
    respond_to do |format|
      format.js
    end
  end
  
  private
  def set_post
    @post = Post.find_by_id params[:id]
  end

  def post_params
    params.require(:post).permit(:body)
  end

end

