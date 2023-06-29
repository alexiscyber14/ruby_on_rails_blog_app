module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_user!

      def index
        users = User.all

        render json: users
      end
    end
  end
end
