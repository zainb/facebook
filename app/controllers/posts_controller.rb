class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  # GET /posts
  # GET /posts.json
  def index
    @my_posts = Post.where(user_id: current_user)
    @friends_posts = Post.where(user_id: current_user.friends)
    @post = Post.new
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order('created_at desc')
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.create(post_params)
    @my_posts = Post.where(user_id: current_user)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.js
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body)
    end
end

