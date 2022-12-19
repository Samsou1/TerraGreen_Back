require 'rails_helper'


RSpec.describe "/countries", type: :request do

  let(:valid_attributes) {
    {
      name:'CountryTest', acronym:'CO'
    }
  }

  let(:invalid_attributes) {
    {
      name:null, acronym: null
    }
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Country.create! valid_attributes
      get countries_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      country = Country.create! valid_attributes
      get country_url(country), as: :json
      expect(response).to be_successful
    end
  end

end
