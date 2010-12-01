class AddFundingToGrants < ActiveRecord::Migration
  def self.up
    add_column :grants, :funding, :integer
  end

  def self.down
    remove_column :grants, :funding
  end
end
