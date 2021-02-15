class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name 
      t.string :date
      t.string :starting_time 
      t.string :starting_location
      t.string :distance
      t.string :level 
      t.text :description
      t.integer :user_id
    end
  end
end
