class ProjectSerializer
  include JSONAPI::Serializer
  attributes :id, :user_id, :title, :content, :date, :address, :city, :postal_code, :project_status_id, :region_id, :country_id, :image_url
end