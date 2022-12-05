class Region < ApplicationRecord
  has_many :projects, class_name: "project", foreign_key: "reference_id"
  has_many :users, class_name: "user", foreign_key: "reference_id"
  belongs_to :country
end
