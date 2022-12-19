require 'rails_helper'

RSpec.describe "/project_statuses", type: :request do


   let(:valid_attributes) {
    {
      name:'ProjectStatusTest'
    }
  }
  
  let(:invalid_attributes) {
    {
      name: null
    }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      ProjectStatus.create! valid_attributes
      get project_statuses_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      project_status = ProjectStatus.create! valid_attributes
      get project_status_url(project_status), as: :json
      expect(response).to be_successful
    end
  end
end
