class RemovePriceInCentsFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :price_in_cents
  end
end
