class User < ApplicationRecord
  has_many :likes, class_name: "like", foreign_key: "reference_id"
  has_many :comments, class_name: "comment", foreign_key: "reference_id"
  has_many :notifications, class_name: "notification", foreign_key: "reference_id"
  has_many :projects, class_name: "project", foreign_key: "reference_id"
  belongs_to :country, class_name: "country", foreign_key: "country_id"
  belongs_to :region, class_name: "region", foreign_key: "region_id"
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :recoverable,
         jwt_revocation_strategy: JwtDenylist

end
