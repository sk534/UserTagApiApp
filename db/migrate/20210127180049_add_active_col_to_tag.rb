class AddActiveColToTag < ActiveRecord::Migration[6.1]
  def change
    add_column :tags,:is_active,:boolean, default: true
  end
end
