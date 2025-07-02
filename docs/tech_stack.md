# Tech Stack

This document provides a detailed overview of the technologies and frameworks used in Krish Flow.

## Backend

- **Ruby on Rails 8**: The core web application framework. Rails provides the MVC (Model-View-Controller) architecture, routing, and ORM (Active Record) for interacting with the database.

## Database

- **PostgreSQL**: A powerful, open-source object-relational database system. It is used as the primary data store for Krish Flow, handling all application data.

## Frontend

- **Bootstrap**: A popular CSS framework for developing responsive and mobile-first websites. It is used for styling and UI components.
- **Hotwire (Turbo, Stimulus)**: A modern approach to building web applications without writing much JavaScript. Turbo provides fast page navigation and partial page updates, while Stimulus adds behavior to HTML with a light JavaScript footprint.
- **React (optional)**: While Hotwire is the primary frontend approach, the project structure allows for the integration of React components for more complex interactive UIs if needed.

## Authentication

- **Devise**: A flexible authentication solution for Rails. It handles user registration, login, password recovery, and other authentication-related features.

## Data Exporting

- **`prawn`**: A Ruby library for generating PDF documents. Used for exporting reports and other data in PDF format.
- **`csv`**: Ruby's built-in CSV library, used for generating CSV files for data exports.
- **`caxlsx`**: A Ruby library for generating Excel (XLSX) files. Used for more complex data exports to spreadsheets.
