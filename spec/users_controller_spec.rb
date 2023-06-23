require 'rails_helper'

RSpec.describe UsersController, type: :request do
  include ActionView::Helpers::AssetTagHelper

  describe 'GET index' do
    it 'renders the index template' do
      get users_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      user = User.create(name: 'John',
                         photo: 'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png')

      allow_any_instance_of(ActionView::Helpers::AssetTagHelper)
        .to receive(:image_tag).and_return('<img src="user_profile_photo.jpg" />')

      get user_path(user)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end
end
