class ProjectSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :content, :project_status_id, :user_id, :date, :address, :city, :postal_code, :GPS, :region_id, :country_id,  :image_url, :updated_at
end