class ProjectStatus < ApplicationRecord*
  has_many :projects, class_name: "project", foreign_key: "reference_id"
end
