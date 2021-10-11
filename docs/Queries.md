## Queries

#### Menu

```rb
Menu.create(name: "Breakfasr")
Menu.create(name: "Lunch")
Menu.create(name: "Dinner")
```

#### MenuItems

```rb
MenuItem.create(menu_id: 1 , name:"French Toast" ,description:"Awesome Egg Stuff" , price: 40 )
MenuItem.create(menu_id: 1 , name:"VadaPav" ,description:"Maharashtrian Food Dish" , price: 10 )
MenuItem.create(menu_id: 2 , name:"Idli" ,description:"South Indian Food Dish" , price: 30 )
MenuItem.create(menu_id: 2 , name:"Chai" ,description:"Morning Refreshment Drink" , price: 5 )
MenuItem.create(menu_id: 3 , name:"Palak Panner" ,description:"Spinach Recipe" , price: 80 )
MenuItem.create(menu_id: 3 , name:"Matar Panner" ,description:"Matar Recipe" , price: 90 )
MenuItem.create(menu_id: 3 , name:"Fried Rice" ,description:"Rice Recipe" , price: 120 )
```

### Users

uncomment the gem file with install becrypt

then run `bundle`

add `has_secure_password` in ActiveRecord Model File

```rb
User.create(name: "Deepankar",email: "test@gmail.com", password:"test1234" , role: "customer")
User.create(name: "Duma",email: "test@gmail.com", password:"test1234" , role: "clerk")
User.create(name: "Danillo",email: "test@gmail.com", password:"test1234" , role: "owner")
```

```rb
Order.create(user_id: 2 ,delivered_at: "")
Order.create(user_id: 1 ,delivered_at: "")
Order.create(user_id: 1 ,delivered_at: "")
```

CreateOrderItems order_id:bigint menu_item_id:bigint menu_item_name:string menu_item_price:bigint

```rb
OrderItem.create(order_id: 19, menu_item_id: 2 , menu_item_name: "Coffee" ,  menu_item_price: 30 , count: 0 )
OrderItem.create(order_id: 19, menu_item_id: 3 , menu_item_name: "Tea" ,  menu_item_price: 20, count: 0  )
OrderItem.create(order_id: 19, menu_item_id: 4 , menu_item_name: "Milk" ,  menu_item_price: 10 , count: 0 )
```

Deploy Migration

Users

```rb
User.create(name: "Owner",email: "owner@gmail.com", password:"test" , role: "owner")
User.create(name: "Duma",email: "duma@gmail.com", password:"test" , role: "clerk")
User.create(name: "Danillo",email: "dan@gmail.com", password:"test" , role: "customer")
```

Menus:

```rb
Menu.create(name: "Breakfasr")
Menu.create(name: "Lunch")
Menu.create(name: "Dinner")
Menu.create(name: "Brunch")
Menu.create(name: "Snacks")
```

MenuItems:

```rb
MenuItem.create(menu_id: 1 , name:"French Toast" ,description:"Awesome Egg Stuff" , price: 40 )
MenuItem.create(menu_id: 1 , name:"VadaPav" ,description:"Maharashtrian Food Dish" , price: 10 )
MenuItem.create(menu_id: 2 , name:"Idli" ,description:"South Indian Food Dish" , price: 30 )
MenuItem.create(menu_id: 2 , name:"Chai" ,description:"Morning Refreshment Drink" , price: 5 )
MenuItem.create(menu_id: 3 , name:"Palak Panner" ,description:"Spinach Recipe" , price: 80 )
MenuItem.create(menu_id: 3 , name:"Matar Panner" ,description:"Matar Recipe" , price: 90 )
MenuItem.create(menu_id: 3 , name:"Fried Rice" ,description:"Rice Recipe" , price: 120 )
MenuItem.create(menu_id: 4 , name:"Sandwich" ,description:"Bread and Veggies" , price: 40 )
MenuItem.create(menu_id: 4 , name:"Burger" ,description:"Bun and Veggies" , price: 50 )
MenuItem.create(menu_id: 5 , name:"French Fries" ,description:"Not from France" , price: 90 )
MenuItem.create(menu_id: 5 , name:"Pani Puri" ,description:"Exlosive Flavours" , price: 25 )
```
