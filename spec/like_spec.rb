# spec/models/like_spec.rb
require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "associations" do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should belong_to(:post).class_name('Post').with_foreign_key('post_id') }
  end

  describe "callbacks" do
    let(:post) { create(:post) }

    describe "after_create :update_post_likes_counter" do
      it "increments the likes counter of the post" do
        expect {
          create(:like, post: post)
        }.to change { post.likes_counter }.by(1)
      end
    end
  end
end

