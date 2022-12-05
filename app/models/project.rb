class Project < ApplicationRecord
  belongs_to :project_status
  belongs_to :region
  belongs_to :country
  belongs_to :user
  validates :title, :content, :user, :content, :region, :country, :project_status, presence: true
  validates :title,
  length: {
    minimum: 5
  }, allow_nil: false
  validates :content,
  length: {
    minimum: 10
  }, allow_nil: false
end
