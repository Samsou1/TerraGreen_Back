class Project < ApplicationRecord
  belongs_to :project_status
  belongs_to :region
  belongs_to :country
end
