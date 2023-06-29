# module Api
#   module V1
#     class CommentsController < ApplicationController
#       skip_before_action :authenticate_user!
#       before_action :set_post, only: [:create]
#
#       def create
#         comment = @post.comments.new(comment_params)
#         comment.user = current_user
#
#         if comment.save
#           render json: comment, status: :created
#         else
#           render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
#         end
#       end
#
#       def add_comment
#         @post = Post.find(params[:id])
#         comment = @post.comments.new(comment_params)
#         comment.user = current_user
#
#         if comment.save
#           render json: comment, status: :created
#         else
#           render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
#         end
#       end
#
#       private
#
#       def set_post
#         @post = Post.find(params[:post_id])
#       end
#
#       def comment_params
#         params.require(:comment).permit(:text)
#       end
#     end
#   end
# end
