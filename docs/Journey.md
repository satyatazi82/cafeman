## My Journey:

21st January 2021

Hopefully i will be Able to Complete this before February

I will be Starting with Menu Managment First

Creating the Database

```bash
psql
create database cafeman;

# \l
# to see all your database
```

To create Rails Project:

```bash
cd desktop
rails new cafeman
```

Installing pg in rails

```sh
bundle remove sqlite3
bundle add pg
bundle install
```

Configuring DataBase

In `config/database.yml`

```yml
default: &default
  adapter: postgresql
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  host: localhost
  user: postgres
  password: changeme
  database: cafeman

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: test_cafeman

production:
  <<: *default
  database: prod_cafeman
```

Creating Tables with Rails Migrations

```bash
rails generate migration CreateMenuItems menu_id:bigint name:string description:string price:bigint
```

```bash
rails generate migration CreateMenus name:string
```

You have run migration too !

```bash
bin/rails db:migrate RAILS_ENV=development
```

Adding Routes in `config/routes.rb`

```rb
resources :menus
resources :menu_items
```

Creating the "MVC" structure:

Database: Menus , MenuItems

Routes:

```rb
Rails.application.routes.draw do
  resources :menus
  resources :menu_items
end
```

Controllers:

```rb
class MenusController < ApplicationController
  def index
    render plain: "Menu Page"
  end
end

### and

class MenuItemsController < ApplicationController
  def index
    render plain: "MenuItems Page"
  end
end

```

Models:

```rb
class MenuItem < ActiveRecord::Base
  belongs_to :menu
end

### and

class Menu < ActiveRecord::Base
  has_many :menu_items
end

```

Populate Database:

```bash
rails console

Menu.create(name: "Breakfasr")
Menu.create(name: "Lunch")
Menu.create(name: "Dinner")
```

```bash
MenuItem.create(menu_id: 1 , name:"French Toast" ,description:"Awesome Egg Stuff" , price: 40 )
MenuItem.create(menu_id: 1 , name:"VadaPav" ,description:"Maharashtrian Food Dish" , price: 10 )
MenuItem.create(menu_id: 2 , name:"Idli" ,description:"South Indian Food Dish" , price: 30 )
MenuItem.create(menu_id: 2 , name:"Chai" ,description:"Morning Refreshment Drink" , price: 5 )
MenuItem.create(menu_id: 3 , name:"Palak Panner" ,description:"Spinach Recipe" , price: 80 )
MenuItem.create(menu_id: 3 , name:"Matar Panner" ,description:"Matar Recipe" , price: 90 )
MenuItem.create(menu_id: 3 , name:"Fried Rice" ,description:"Rice Recipe" , price: 120 )
```

Bootstrap:

```bash
# not sure tbh
yarn add bootstrap
```

then rename `application.css` to `application.scss` add the following: `@import 'bootstrap/scss/bootstrap';`

Adding / Deleting API:

```rb
resources :menu_items
```

This gives us 7 different routes:

GET /photos photos#index display a list of all photos
GET /photos/new photos#new return an HTML form for creating a new photo
POST /photos photos#create create a new photo
GET /photos/:id photos#show display a specific photo
GET /photos/:id/edit photos#edit return an HTML form for editing a photo
PATCH/PUT /photos/:id photos#update update a specific photo
DELETE /photos/:id photos#destroy delete a specific photo

Add this in Controller Class to test the API with Postman

```rb
skip_before_action :verify_authenticity_token
```

Creating Users Table

```rb
rails generate migration CreateUsers name:string email:string password_digest:string role:string
```

```rb
rails generate migration CreateOrders user_id:bigint delivered_at:datetime
```

```rb
rails generate migration CreateOrderItems order_id:bigint menu_item_id:bigint menu_item_name:string menu_item_price:bigint
```

run migrations and later create models and contorllers
