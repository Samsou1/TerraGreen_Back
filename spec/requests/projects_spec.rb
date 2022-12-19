require 'rails_helper'


RSpec.describe "/projects", type: :request do

  before(:each) do

    @country = Country.create!(name:'Countrytest', acronym:'CO')
    @region = Region.create!(name:'Regiontest', country_id: @country.id)
    @project_status = ProjectStatus.create!(name:'ProjectStatstest')
    @user = User.create!(email: "test@example.com", password: "Password1")
  end
  
  let(:valid_attributes) {
    {title: 'Project title', content: 'Project content', user_id: @user.id, country_id: @country.id, region_id: @region.id, project_status_id: @project_status.id}
    
  }
  
  let(:invalid_attributes) {
    {title: null, content: null, user_id: null, country_id: null, region_id: null, project_status_id: null}
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Project.create! valid_attributes
      get projects_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      project = Project.create! valid_attributes
      get project_url(project), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Project" do
        expect {
          post projects_url,
               params: { project: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Project, :count).by(1)
      end

      it "renders a JSON response with the new project" do
        post projects_url,
             params: { project: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Project" do
        expect {
          post projects_url,
               params: { project: invalid_attributes }, as: :json
        }.to change(Project, :count).by(0)
      end

      it "renders a JSON response with errors for the new project" do
        post projects_url,
             params: { project: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested project" do
        project = Project.create! valid_attributes
        patch project_url(project),
              params: { project: new_attributes }, headers: valid_headers, as: :json
        project.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the project" do
        project = Project.create! valid_attributes
        patch project_url(project),
              params: { project: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the project" do
        project = Project.create! valid_attributes
        patch project_url(project),
              params: { project: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested project" do
      project = Project.create! valid_attributes
      expect {
        delete project_url(project), headers: valid_headers, as: :json
      }.to change(Project, :count).by(-1)
    end
  end
end
