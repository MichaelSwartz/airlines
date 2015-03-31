class AddColumnReviewsAirlineId < ActiveRecord::Migration
  def change
    add_column :reviews, :airline_id, :integer, null: false
  end
end
