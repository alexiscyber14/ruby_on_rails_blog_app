require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "should not save post without title" do
    post = Post.new
    assert_not post.save, "Saved the post without a title"
  end

  test "should save post with valid attributes" do
    post = Post.new(title: "Test Post", comments_counter: 0, likes_counter: 0)
    assert post.save, "Could not save the post with valid attributes"
  end
end
