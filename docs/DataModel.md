- Menus:

  - id
  - name

- MenuItems:

  - id
  - menu_id
  - name
  - description
  - price

  ###

- Orders:

  - id
  - date
  - user_id
  - delivered_at

- OrderItems:
  - id
  - order_id
  - menu_item_id
  - menu_item_name
  - menu_item_price

###

- Users:
  - id
  - first_name
  - last_name
  - role
  - password_digest
