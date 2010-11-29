class AddInfoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :department, :string
    add_column :users, :student_number, :integer
    add_column :users, :degree, :integer
    add_column :users, :year, :date
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :phone
    remove_column :users, :department
    remove_column :users, :student_number
    remove_column :users, :degree
    remove_column :users, :year
  end
end
