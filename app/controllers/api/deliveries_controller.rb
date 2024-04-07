class Api::DeliveriesController < ApplicationController
  def create
    delivery = Delivery.new(delivery_params)

    if delivery.save
      render json: { message: 'Delivery created successfully', delivery: delivery }, status: :created
    else
      render json: { error: 'Failed to create delivery', errors: delivery.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private

  def delivery_params
    params.require(:delivery).permit(:path_id, :description, :status, :delivery_date, :delivery_time, :signature, :observations, :delivery_photo)
  end
end
