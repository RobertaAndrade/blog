class BlogPost < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  
  paginates_per 3

  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true
end
