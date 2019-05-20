class ChangeDataUserProductNumberToUserProducts < ActiveRecord::Migration[5.2]
  def change
  	change_column :user_products, :user_product_number, :integer
  end
end
