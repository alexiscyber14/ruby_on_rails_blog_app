class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :increment_comment_count

  def increment_comment_count
    post.increment!(:comments_counter)
  end

  validates :author_id, presence: true
  validates :text, presence: true
end
