class AddPropertyTypeToFlat < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :property_type, :string
  end
end
