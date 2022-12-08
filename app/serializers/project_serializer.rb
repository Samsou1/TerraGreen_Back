class ProjectSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :content, :project_status_id, :date, :address, :city, :postal_code, :GPS, :region_id, :country_id
end
