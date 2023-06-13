class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :increment_comment_count

  def increment_comment_count
    post.increment!(:comments_counter)
  end

  attr_accessor :author_id

  validates :author_id, presence: true
end
