class AddColumnUserIdAirplanes < ActiveRecord::Migration
  def change
    add_column :airlines, :user_id, :integer, null: false
  end
end
