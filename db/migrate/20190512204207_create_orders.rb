class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :payment_method
      t.integer :ship_status
      t.integer :total_price
      t.string :order_ship_last_name
      t.string :order_ship_first_name
      t.string :order_ship_ruby_last_name
      t.string :order_ship_ruby_first_name
      t.string :order_ship_post_code
      t.string :order_ship_address

      t.timestamps
    end
  end
end
