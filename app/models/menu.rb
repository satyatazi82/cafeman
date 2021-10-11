class Menu < ActiveRecord::Base
  validates :name, presence: true
  has_many :menu_items

  def self.get_active_menu_name
    all.find(ActiveMenu.first.active_menu).name
  end
end
