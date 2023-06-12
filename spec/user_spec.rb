# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:post_counter).is_greater_than_or_equal_to(0) }
  end

  describe "associations" do
    it { should have_many(:posts).with_foreign_key('author_id') }
    it { should have_many(:comments).with_foreign_key('author_id') }
    it { should have_many(:likes).with_foreign_key('author_id') }
  end

  describe "methods" do
    let(:user) { User.new(name: "John") }

    describe "#recent_posts" do
      it "returns the 3 most recent posts" do
        posts = create_list(:post, 5, author: user)
        expect(user.recent_posts(3)).to eq(posts.last(3))
      end
    end
  end
end
