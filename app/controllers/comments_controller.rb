class CommentsController < ApplicationController
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
  
    private
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
  