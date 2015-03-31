class AddUniquenessToAirline < ActiveRecord::Migration
  def change
    add_index(:airlines, :name, :unique => true)
  end
end
