class ProjectStatus < ApplicationRecord
  validates :name, presence: true
  validates :name,
  length: {
    minimum: 2
  }, allow_nil: false
end
