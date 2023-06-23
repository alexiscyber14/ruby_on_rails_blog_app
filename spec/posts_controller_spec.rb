require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET index' do
    before(:each) do
      get user_posts_path(user)
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      user = User.create(name: 'John')
      post = Post.create(title: 'Hello',
                         text: 'This is a post', author_id: user.id)
      get user_post_path(user_id: post.author_id, id: post.id)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      #expect(response.body).to include('User posts')
    end
  end
end
