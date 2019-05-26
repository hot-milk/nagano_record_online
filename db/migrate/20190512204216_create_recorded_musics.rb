class CreateRecordedMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :recorded_musics, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :product_id
      t.string :recorded_music_name
      t.integer :recorded_music_number
      t.integer :recorded_disk_number

      t.timestamps
    end
  end
end
