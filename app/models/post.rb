class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_create :increment_user_post_count

  # Increment user posts count
  def increment_user_post_count
    author.increment!(:posts_counter)
  end

  # Return user most recent comments
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private :increment_user_post_count
end
