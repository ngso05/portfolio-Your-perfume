class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def edit
  end

  def show
  end

  def destroy
  end

  def update
  end

  private
  def post_params
    params.require(:post).permit(:title, :rate_easy, :rate_smell, :rate_price, :rate_time, :image, :review)
  end
end
