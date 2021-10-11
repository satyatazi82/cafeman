def signin(user)
  post "/users/",
    params: { email: user.email, password: user.password_digest, role: user.role, name: user.name }
end

def create_menu
  menu = Menu.create(name: "Lunch")
  return menu
end

def create_order
  new_order = Order.create(user_id: User.first.id, delivered_at: "", order_status: "cart")
  new_order.id
end

def add_menu_item(id, item)
  new_menu_item = MenuItem.create(menu_id: id, name: item.name, description: item.description, price: item.price)
end
