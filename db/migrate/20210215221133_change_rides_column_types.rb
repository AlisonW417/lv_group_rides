class ChangeRidesColumnTypes < ActiveRecord::Migration
  def change
    change_column :rides, :date, :date 
  end
end
