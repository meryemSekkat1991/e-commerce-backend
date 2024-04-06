class AddCategoryToProduct < ActiveRecord::Migration[7.0]
  def change
    #add_reference :products, :category, null: false, foreign_key: true
    add_column :products, :category, :text
  end
end
