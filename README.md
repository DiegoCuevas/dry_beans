# Dry Beans API

Welcome to the documentation for the Dry Beans API. This API is designed to manage journeys, paths, and deliveries for logistics operations.

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Models](#models)
- [Endpoints](#endpoints)
- [Tests](#testing)
- [Versions](#versions)

## Installation

  Instructions on how to install and set up the project.

1. Clone the repository:
```bash
git clone git@github.com:DiegoCuevas/dry_beans.git  
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database:
```bash
rails db:create
rails db:migrate
```

4. Fake data in seeds.rb (optional) 
```bash
rails db:seed
```


## Usage 

  The base URL for the API is `http://localhost:3000/api`.
  ```
    rails server
  ```


## Models

### Journey

Represents a journey from one location to another.

- **Attributes:**
  - `id`: Unique identifier for the journey.
  - `name`: Name of the journey.
  - `origin_id`: ID of the origin location.
  - `destination_id`: ID of the destination location.

### Path

Represents a specific path within a journey.

- **Attributes:**
  - `id`: Unique identifier for the path.
  - `journey_id`: ID of the associated journey.
  - `start_time`: Start time of the path.
  - `end_time`: End time of the path.

### Delivery

Represents a delivery or retrieval within a path.

- **Attributes:**
  - `id`: Unique identifier for the delivery.
  - `path_id`: ID of the associated path.
  - `description`: Description of the delivery.
  - `status`: Status code indicating the delivery status.
  - `delivery_date` (date): Date of the delivery.
  - `delivery_time` (time): Time of the delivery.
  - `signature`: Signature for the delivery.
  - `observations`: Observations related to the delivery.
  - `delivery_photo`: URL or path to the delivery photo.
  - `sender_first_name`: Sender's first name.
  - `sender_last_name`: Sender's last name.
  - `sender_full_name`: Sender's full name (automatically generated).
  - `receiver_signature` (required): Receiver signature.
  - `receiver_first_name` (required): Receiver's first name.
  - `receiver_last_name` (required): Receiver's last name.
  - `receiver_full_name`: Receiver's full name (automatically generated).

## Endpoints

### Journeys

- **GET `/api/journeys/:id`**
  - Returns details of a specific journey including paths and deliveries.

### Deliveries

- **POST `/api/deliveries`**
  - Creates a new delivery with the sender information.
  - Required parameters: `path_id`, `description`, `sender_first_name`, `sender_last_name`, `signature`.

- **PATCH `/api/deliveries/:id/delivered`**
  - Completes the delivery automatically when the receiver has entered his data correctly.

## Testing

I made some tests to test certain functionalities and responses of some endpoints, and you can run them with the following command:
```
  bundle exec rspec
```
Also the API can be tested using tools like Postman or cURL. Make sure to include valid request parameters based on the endpoint documentation.

## Versions

- Ruby version: 2.7.7
- Rails version: 7.1.3
- RSpec version: 3.13.0

---
