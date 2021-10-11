class CreateActiveMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :active_menus do |t|
      t.bigint :active_menu

      t.timestamps
    end
  end
end
