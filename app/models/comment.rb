class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user, :project, :content, presence: true
  validates :content,
  length: {
    minimum: 2
  }, allow_nil: false
end
