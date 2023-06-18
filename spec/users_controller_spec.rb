require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET index' do
    it 'renders the index template' do
      get users_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('Placeholder text for index')
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      user = User.create(name: 'John')
      get user_path(user)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Placeholder text for show')
    end
  end
end
