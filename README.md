# Jungle

Jungle is an e-commerce platform built with Ruby on Rails server-side web app framework. Unit testing 
is handled using Rspec. Integration / End-to-end tests are automated using Capybara combined with a headless Poletgeist 
browser.

## Final Product

#### Landing Page
!["Landing Page"](https://github.com/remy29/jungle/blob/master/public/screenshots/landing_page.png?raw=true)

#### Cart View
!["Cart View"](https://github.com/remy29/jungle/blob/master/public/screenshots/cart_view.png?raw=true)

#### Product Description View
![Product Description View](https://github.com/remy29/jungle/blob/master/public/screenshots/product_description_view.png?raw=true)

#### Admin Product View
!["Admin Product View"](https://github.com/remy29/jungle/blob/master/public/screenshots/admin_product_view.png?raw=true)

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

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Note

* Testing implemented with RSpec and Capybara


###### Version 1.0.0

