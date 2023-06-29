module Api
  module V1
    class PostsController < ApplicationController
      skip_before_action :authenticate_user!

      def index
        user = User.find(params[:user_id])
        posts = user.posts

        render json: posts
      end

      def comments
        post = Post.find(params[:id])
        comments = post.comments

        render json: comments
      end

      def add_comment
        @post = Post.find(params[:id])
        comment = @post.comments.new(comment_params)
        comment.user = current_user

        if comment.save
          render json: comment, status: :created
        else
          render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
