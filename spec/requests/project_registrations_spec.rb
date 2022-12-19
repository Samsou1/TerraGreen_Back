require 'rails_helper'



RSpec.describe "/project_registrations", type: :request do
  before(:each) do
    @country = Country.create!(name:'Countrytest', acronym:'CO')
    @region = Region.create!(name:'Regiontest', country_id: @country.id)
    @project_status = ProjectStatus.create!(name:'ProjectStatstest')
    @user = User.create!(email: "test@example.com", password: "Password1")
    @project = Project.create!(title: 'Project title', content: 'Project content', user_id: @user.id, country_id: @country.id, region_id: @region.id, project_status_id: @project_status.id)
  end

   let(:valid_attributes) {
    {
      user_id: @user.id,
      project_id: @project.id,
    }
  }
  
  let(:invalid_attributes) {
    {
      user_id: null,
      project_id: null,
    }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      ProjectRegistration.create! valid_attributes
      get project_registrations_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      project_registration = ProjectRegistration.create! valid_attributes
      get project_registration_url(project_registration), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ProjectRegistration" do
        expect {
          post project_registrations_url,
               params: { project_registration: valid_attributes }, headers: valid_headers, as: :json
        }.to change(ProjectRegistration, :count).by(1)
      end

      it "renders a JSON response with the new project_registration" do
        post project_registrations_url,
             params: { project_registration: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ProjectRegistration" do
        expect {
          post project_registrations_url,
               params: { project_registration: invalid_attributes }, as: :json
        }.to change(ProjectRegistration, :count).by(0)
      end

      it "renders a JSON response with errors for the new project_registration" do
        post project_registrations_url,
             params: { project_registration: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested project_registration" do
        project_registration = ProjectRegistration.create! valid_attributes
        patch project_registration_url(project_registration),
              params: { project_registration: new_attributes }, headers: valid_headers, as: :json
        project_registration.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the project_registration" do
        project_registration = ProjectRegistration.create! valid_attributes
        patch project_registration_url(project_registration),
              params: { project_registration: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the project_registration" do
        project_registration = ProjectRegistration.create! valid_attributes
        patch project_registration_url(project_registration),
              params: { project_registration: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested project_registration" do
      project_registration = ProjectRegistration.create! valid_attributes
      expect {
        delete project_registration_url(project_registration), headers: valid_headers, as: :json
      }.to change(ProjectRegistration, :count).by(-1)
    end
  end
end
