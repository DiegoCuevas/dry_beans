class Api::DeliveriesController < ApplicationController
  def create
    delivery = Delivery.new(delivery_params)

    if delivery.save
      render json: { message: 'Delivery created successfully', delivery: delivery }, status: :created
    else
      render json: { error: 'Failed to create delivery', errors: delivery.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def delivered
    delivery = Delivery.find(params[:id])

    if delivery.update_receiver_info(received_params)
      render json: { message: 'Details updated successfully', delivery: delivery }, status: :ok
    else
      render json: { error: 'Failed to update details', errors: delivery.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  private

  def delivery_params
    params.require(:delivery).permit(:path_id, :description, :sender_first_name, :sender_last_name, :signature)
  end

  def received_params
    params.require(:delivery).permit(
      :delivery_photo, 
      :observations, 
      :receiver_signature, 
      :receiver_first_name, 
      :receiver_last_name
    )
  end
end
