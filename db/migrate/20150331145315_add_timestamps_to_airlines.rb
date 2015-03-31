class AddTimestampsToAirlines < ActiveRecord::Migration
  def change
    add_column :airlines, :created_at, :datetime
    add_column :airlines, :updated_at, :datetime
  end
end
