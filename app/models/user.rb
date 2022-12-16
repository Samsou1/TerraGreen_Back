class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :project_registrations, dependent: :destroy
  has_many :projects, dependent: :destroy
  belongs_to :country, class_name: 'country', foreign_key: 'country_id', optional: true
  belongs_to :region, class_name: 'region', foreign_key: 'region_id', optional: true
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :recoverable,
         jwt_revocation_strategy: JwtDenylist

  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
