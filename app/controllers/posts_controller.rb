class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @post.comments.includes(:user)
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def add_like
    @post = Post.find(params[:id])
    @like = @post.likes.new(user: current_user)
    if @like.save
      redirect_to @post
    else
      # Handle like creation error
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
