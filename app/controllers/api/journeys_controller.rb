class Api::JourneysController < ApplicationController
  def show
    journey = Journey.joins(paths: :deliveries).find(params[:id])

    render json: serialize_journey(journey)
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Journey not found' }, status: :not_found
  end

  private

  def serialize_journey(journey)
    {
      id: journey.id,
      name: journey.name,
      origin: journey.origin.name,
      destination: journey.destination.name,
      paths: journey.paths.map { |path| serialize_path(path) }
    }
  end

  def serialize_path(path)
    {
      id: path.id,
      delivery_date: path.delivery_date,
      start_time: path.start_time&.strftime('%H:%M'),
      end_time: path.end_time&.strftime('%H:%M'),
      deliveries: path.deliveries.map { |delivery| serialize_delivery(delivery) }
    }
  end

  def serialize_delivery(delivery)
    {
      id: delivery.id,
      description: delivery.description,
      status: delivery.status,
      delivery_date: delivery.delivery_date,
      delivery_time: delivery.delivery_time&.strftime('%H:%M'),
      signature: delivery.signature,
      sender_first_name: delivery.sender_first_name,
      sender_last_name: delivery.sender_last_name,
      sender_full_name: delivery.sender_full_name,
      observations: delivery.observations,
      delivery_photo: delivery.delivery_photo,
      receiver_first_name: delivery.receiver_first_name,
      receiver_last_name: delivery.receiver_last_name,
      receiver_full_name: delivery.receiver_full_name,
      receiver_signature: delivery.receiver_signature
    }
  end
end
