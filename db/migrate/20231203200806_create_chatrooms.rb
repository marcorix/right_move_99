class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :booking, null: false, foreign_key: true
      t.references :tenant, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
