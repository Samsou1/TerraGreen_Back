class Like < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user, uniqueness: { scope: :project }
  validates :user, :project, presence: true
end
