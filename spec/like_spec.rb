require 'rails_helper'

describe Like, type: :model do
  describe 'validations' do
    let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }

    subject do
      Like.new(author_id: user.id, post_id: post.id)
    end

    before { subject.save }

    it 'should not have a blank author_id' do
      subject.author_id = nil
      expect(subject).to be_invalid
    end
  end
end
