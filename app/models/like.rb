class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :increment_like_count

  def increment_like_count
    post.increment!(:likes_counter)
  end

  # attr_accessor :post_id

  validates :post_id, presence: true
end
