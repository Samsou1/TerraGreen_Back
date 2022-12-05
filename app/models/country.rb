class Country < ApplicationRecord
  has_many :regions, dependent: :destroy
  has_many :projects, class_name: "project", foreign_key: "reference_id"
  has_many :users, class_name: "user", foreign_key: "reference_id"
  validates :name, :acronym, presence: true
end
