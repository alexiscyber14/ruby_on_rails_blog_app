class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(@post.author, @post), notice: 'Successfully added a comment.' }
      else
        @user = @post.author
        flash[:error] = @comment.errors.full_messages
        format.html { redirect_to user_post_path(@user, @post) }
      end
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.destroy
    post.decrement!(:comments_counter)
    respond_to do |format|
      format.html { redirect_to user_post_path(post.author, post), notice: 'Comment was successfully destroyed' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
