class Project < ApplicationRecord
  has_one_attached :image
  belongs_to :project_status
  belongs_to :region
  belongs_to :country
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :project_registrations, dependent: :destroy
  has_many :notifications, dependent: :destroy
  validates :title, :content, :user, :content, :region, :country, :project_status, presence: true
  validates :title,
  length: {
    minimum: 2
  }, allow_nil: false
  validates :content,
  length: {
    minimum: 5
  }, allow_nil: false

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?    
  end
end
