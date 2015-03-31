class CreateAirlinesTable < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :name, null: false
      t.text :description
      t.string :link_url
      t.string :logo_url
    end
  end
end
