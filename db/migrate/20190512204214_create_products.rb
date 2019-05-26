class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :artist_id
      t.integer :genre_id
      t.integer :label_id
      t.integer :product_category
      t.string :product_name
      t.string :jacket_image_id
      t.string :price
      t.string :stock
      t.integer :status

      t.timestamps
    end
  end
end
