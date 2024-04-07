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
      observations: delivery.observations,
      delivery_photo: delivery.delivery_photo
    }
  end
end
