class AddUsername < ActiveRecord::Migration[6.1]
  def change
    add_column :users,:username,:string
    add_column :users,:is_admin,:boolean, default: false
  end
end
