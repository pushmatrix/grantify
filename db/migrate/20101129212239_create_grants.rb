class CreateGrants < ActiveRecord::Migration
  def self.up
    create_table :grants do |t|
      t.string :conference_name
      t.boolean :prev_apply
      t.date :conference_date
      t.integer :region
      t.integer :user_id
      t.integer :status
      t.float :registration_cost
      t.float :transportation_cost
      t.float :accommodation_cost
      t.float :meal_cost
      t.float :department_assis
      t.float :faculty_assis
      t.float :other_assis
      t.timestamps
    end
  end

  def self.down
    drop_table :grants
  end
end
