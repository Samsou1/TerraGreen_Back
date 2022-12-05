class Country < ApplicationRecord
  has_many :regions, class_name: "region", foreign_key: "reference_id"
  has_many :projects, class_name: "project", foreign_key: "reference_id"
  has_many :users, class_name: "user", foreign_key: "reference_id"
end
