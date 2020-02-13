# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Screenshots

![Jungle Homepage](https://github.com/mxmitch/jungle-rails/blob/master/docs/jungle-homepage.png?raw=true)
![Jungle Category Page](https://github.com/mxmitch/jungle-rails/blob/master/docs/jungle-category.png?raw=true)
![Jungle Cart Page](https://github.com/mxmitch/jungle-rails/blob/master/docs/jungle-cart.png?raw=true)
![Jungle Order Summary Page](https://github.com/mxmitch/jungle-rails/blob/master/docs/jungle-order.png?raw=true)
![Jungle Sign Up](https://github.com/mxmitch/jungle-rails/blob/master/docs/jungle-signup.png?raw=true)
![Jungle Admin Product Page](https://github.com/mxmitch/jungle-rails/blob/master/docs/jungle-admin-products.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
