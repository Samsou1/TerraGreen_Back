class ProjectRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user, :project, presence: true
end
