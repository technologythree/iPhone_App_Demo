class AddRatingToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :rating, :integer,  :default => 1
  end

  def self.down
    remove_column :comments, :rating
  end
end
