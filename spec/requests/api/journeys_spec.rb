# spec/controllers/journeys_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::JourneysController, type: :controller do
  describe "GET #show" do
    let(:journey) { create(:journey) }

    before do
      create_list(:path, 3, journey: journey)
      create_list(:delivery, 5, path: journey.paths.first)
    end

    it "returns a journey with paths and deliveries" do
      get :show, params: { id: journey.id }

      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      journey_response = json_response

      expect(journey_response["id"]).to eq(journey.id)
      expect(journey_response["name"]).to eq(journey.name)
      expect(journey_response["paths"].count).to eq(3)
      expect(journey_response["paths"][0]["deliveries"].count).to eq(5)
    end

    it "returns not found if journey does not exist" do
      get :show, params: { id: 999 }

      expect(response).to have_http_status(:not_found)

      json_response = JSON.parse(response.body)
      expect(json_response["error"]).to eq("Journey not found")
    end
  end
end
