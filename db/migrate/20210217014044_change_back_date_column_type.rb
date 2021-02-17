class ChangeBackDateColumnType < ActiveRecord::Migration
  def change
    change_column :rides, :date, :string
  end
end
