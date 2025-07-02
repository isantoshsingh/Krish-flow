# KrishFlow Admin Guide

This guide provides essential information for administrators managing the KrishFlow application.

## 1. Environment Setup

### Prerequisites

Ensure your system has the following installed:
- Ruby (version specified in `.ruby-version`)
- Ruby on Rails (version specified in `Gemfile.lock`)
- PostgreSQL
- Node.js and Yarn (for frontend assets)
- Docker and Kamal (for deployment)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/isantoshsingh/krishflow.git
    cd krishflow
    ```
2.  **Install Ruby dependencies:**
    ```bash
    bundle install
    ```
3.  **Setup the database:**
    ```bash
    rails db:create db:migrate db:seed
    ```
    *   `db:create`: Creates the PostgreSQL databases for development and test environments.
    *   `db:migrate`: Runs pending database migrations to set up the schema.
    *   `db:seed`: Populates the database with initial data (if `db/seeds.rb` is present).

4.  **Install JavaScript dependencies (if using Webpacker/Propshaft):**
    ```bash
    yarn install
    ```

5.  **Start the Rails server:**
    ```bash
    rails server
    ```

## 2. Database Management

### Migrations

Migrations are used to evolve the database schema. To create a new migration:

```bash
rails generate migration AddColumnToTable column_name:data_type
```

To run pending migrations:

```bash
rails db:migrate
```

To rollback the last migration:

```bash
rails db:rollback
```

### Database Console

Access the Rails database console for direct interaction with your database:

```bash
rails dbconsole
```

### Seeding Data

To re-run the seed file (`db/seeds.rb`) to populate initial data:

```bash
rails db:seed
```

## 3. Environment Configuration

KrishFlow uses environment variables for sensitive information and environment-specific settings.

### `config/credentials.yml.enc`

Sensitive credentials (e.g., API keys, secret keys) are stored encrypted in `config/credentials.yml.enc`. To edit:

```bash
rails credentials:edit
```

This will open the encrypted file in your default editor. Changes are automatically encrypted upon saving.

### Environment-Specific Settings

Configuration files for different environments are located in `config/environments/`:
- `development.rb`: For local development.
- `production.rb`: For production deployments.
- `test.rb`: For running tests.

Adjust settings like logging, caching, and asset compilation in these files as needed.

## 4. Deployment with Kamal

KrishFlow uses Kamal (formerly `mrsk`) for deploying to production servers.

### Configuration

Kamal configuration is typically found in `config/deploy.yml` and `.kamal/` directory.

### Deployment Steps

1.  **Build and push Docker image:**
    ```bash
    kamal build
    ```

2.  **Deploy the application:**
    ```bash
    kamal deploy
    ```

3.  **Access the console on the deployed server:**
    ```bash
    kamal console
    ```

4.  **Run a specific command on the deployed server:**
    ```bash
    kamal exec "rails db:migrate"
    ```

For more detailed Kamal commands and options, refer to the Kamal documentation.

## 5. Monitoring and Logging

- **Logs**: Application logs are typically found in the `log/` directory (e.g., `log/development.log`, `log/production.log`).
- **Error Tracking**: Integrate with error tracking services (e.g., Sentry, Bugsnag) for production error monitoring.
- **Performance Monitoring**: Use tools like New Relic or Skylight for performance insights.

## 6. Security Best Practices

- Regularly update Ruby, Rails, and all gems to their latest secure versions.
- Keep `config/credentials.yml.enc` secure and never commit the master key to version control.
- Implement strong password policies for user authentication.
- Regularly review and audit application logs for suspicious activity.
- Use HTTPS for all production traffic.

## 7. Troubleshooting

- **Common Issues**: Check logs for error messages. Ensure all dependencies are installed and up to date.
- **Database Connection Issues**: Verify database credentials in `config/database.yml` and ensure the PostgreSQL server is running.
- **Asset Precompilation Errors**: Run `rails assets:precompile` locally to debug asset-related issues.
