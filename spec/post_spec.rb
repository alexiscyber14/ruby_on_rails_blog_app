# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0) }
  end

  describe "associations" do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe "methods" do
    let(:post) { create(:post) }

    describe "#update_post_counter" do
      it "increments the post counter of the author" do
        author = post.author
        expect {
          post.update_post_counter
        }.to change { author.post_counter }.by(1)
      end
    end

    describe "#recent_comments" do
      it "returns the 5 most recent comments" do
        comments = create_list(:comment, 10, post: post)
        expect(post.recent_comments(5)).to eq(comments.last(5))
      end
    end
  end
end
