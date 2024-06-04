# README
# TaskManager

TaskManager is a simple task management application built with Ruby on Rails and PostgreSQL.

## Features

1. User authentication using Devise
2. Task management with states (Backlog, In-progress, Done)
3. Deadline alerts via email (1 day and 1 hour before)

## Setup

1. Clone the repository
2. Install dependencies: `bundle install`
3. Set up the database: `rails db:create db:migrate`
4. Start the server: `rails server`
5. Start the redis server: `redis-server`
6. Start the sidekiq server: `bundle exec sidekiq`

## Testing

Run tests with: `rspec`
