require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }

    subject do
      Comment.new(author: user, text: 'Some comment', post:)
    end

    before { subject.save }

    it 'should have a valid text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end
end
