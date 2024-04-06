class AddImageToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :image, polymorphic: true, index: true
  end
end