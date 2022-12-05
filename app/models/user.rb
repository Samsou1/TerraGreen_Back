class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :notifications
  has_many :projects
  belongs_to :country, class_name: "country", foreign_key: "country_id", optional: true
  belongs_to :region, class_name: "region", foreign_key: "region_id", optional: true
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :recoverable,
         jwt_revocation_strategy: JwtDenylist

end
