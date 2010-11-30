class ChangeConferenceDateToString < ActiveRecord::Migration
  def self.up
    remove_column :grants, :conference_date
    add_column :grants, :conference_date, :string
  end

  def self.down
    remove_column :grants, :conference_date
    add_column :grants, :conference_date, :date
  end
end
