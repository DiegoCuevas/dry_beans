require 'rails_helper'

RSpec.describe Api::DeliveriesController, type: :controller do
  describe 'POST #create' do
    let(:path) { create(:path) }
    let(:valid_params) do
      {
        delivery: {
          path_id: path.id,
          description: 'Test delivery',
          status: 'pending',
          delivery_date: Date.today,
          delivery_time: Time.now,
          signature: 'Test signature',
          observations: 'Test observations',
          delivery_photo: 'http://example.com/delivery.jpg'
        }
      }
    end

    context 'with valid params' do
      it 'creates a new delivery' do
        expect {
          post :create, params: valid_params
        }.to change(Delivery, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { valid_params.merge(delivery: { path_id: nil }) }

      it 'does not create a new delivery' do
        expect {
          post :create, params: invalid_params
        }.to_not change(Delivery, :count)
      end

      it 'returns an unprocessable entity response' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        post :create, params: invalid_params
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to eq('Failed to create delivery')
      end
    end
  end
end
