class Comment < ApplicationRecord
  belongs_to :blog_post
  belongs_to :user, optional: true

  validates :content, presence: true
end
