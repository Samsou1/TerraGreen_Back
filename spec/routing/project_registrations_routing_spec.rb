require "rails_helper"

RSpec.describe ProjectRegistrationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/project_registrations").to route_to("project_registrations#index")
    end

    it "routes to #show" do
      expect(get: "/project_registrations/1").to route_to("project_registrations#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/project_registrations").to route_to("project_registrations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/project_registrations/1").to route_to("project_registrations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/project_registrations/1").to route_to("project_registrations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/project_registrations/1").to route_to("project_registrations#destroy", id: "1")
    end
  end
end
