class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :rating, null: false
      t.text :body
      t.boolean :reported

      t.timestamps
    end
  end
end
