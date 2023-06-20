class PostsController < ApplicationController
  def new
    @post = Post.new
  end

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
      redirect_to user_posts_path(@user), notice: 'Post successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
