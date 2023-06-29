module Api
  module V1
    class PostsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_post, only: [:show]

      def index
        user = User.find(params[:user_id])
        posts = user.posts

        render json: posts
      end

      def show
        render json: @post
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end
    end
  end
end
