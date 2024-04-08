# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Limpiar la base de datos antes de agregar nuevos datos de prueba
puts "Limpiando la base de datos..."
Delivery.destroy_all
Path.destroy_all
Journey.destroy_all
Location.destroy_all

# Crear ubicaciones de ejemplo
puts "Creando ubicaciones..."
locations = [
  { name: "Origen A", latitude: "40.7128", longitude: "-74.0060" },
  { name: "Destino B", latitude: "34.0522", longitude: "-118.2437" },
  { name: "Origen C", latitude: "51.5074", longitude: "-0.1278" }
]
Location.create!(locations)

# Crear viajes de ejemplo
puts "Creando viajes..."
journeys = [
  { name: "Viaje 1", origin_id: Location.first.id, destination_id: Location.second.id },
  { name: "Viaje 2", origin_id: Location.third.id, destination_id: Location.second.id }
]
Journey.create!(journeys)

# Crear caminos de ejemplo asociados a los viajes
puts "Creando caminos..."
paths = [
  { journey_id: Journey.first.id, delivery_date: Date.today, start_time: Time.now + 1, end_time: Time.now + 2.hour },
  { journey_id: Journey.first.id, delivery_date: Date.today, start_time: Time.now + 3, end_time: Time.now + 4.hour },
  { journey_id: Journey.second.id, delivery_date: Date.today, start_time: Time.now + 2.hours, end_time: Time.now + 3.hours }
]
Path.create!(paths)

# Crear entregas de ejemplo asociadas a los caminos
puts "Creando entregas..."

deliveries = [
  { path_id: Path.first.id, description: "Entrega 1", signature: "Firma1", sender_first_name: "John",  sender_last_name: "Doe" },
  { path_id: Path.first.id, description: "Entrega 2", signature: "Firma2", sender_first_name: "Jim",  sender_last_name: "Harrison" },
  { path_id: Path.second.id, description: "Entrega 3", signature: "Firma3", sender_first_name: "Jane",  sender_last_name: "Foster" },
  { path_id: Path.last.id, description: "Entrega 4", signature: "Firma4", sender_first_name: "Maria",  sender_last_name: "Manchego" }
]
Delivery.create!(deliveries)

puts "Datos de prueba creados exitosamente!"
