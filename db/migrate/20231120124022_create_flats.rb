class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :address
      t.integer :guests
      t.integer :price

      t.timestamps
    end
  end
end
