class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user, :project, :content, presence: true
  validates :content,
  length: {
    minimum: 5
  }, allow_nil: false
end
