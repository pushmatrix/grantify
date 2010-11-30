class ChangeYearFromDateToInteger < ActiveRecord::Migration
  def self.up
    remove_column :users, :year
    add_column :users, :year, :integer
  end

  def self.down
    remove_column :users, :year
    add_column :users, :year, :date
  end
end
