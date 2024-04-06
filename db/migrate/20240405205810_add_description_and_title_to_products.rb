class AddDescriptionAndTitleToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :description, :text
    add_column :products, :title, :string
  end
end
