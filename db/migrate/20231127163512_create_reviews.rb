class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
