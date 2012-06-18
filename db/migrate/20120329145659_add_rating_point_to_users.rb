class AddRatingPointToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rating_point, :integer, :default => 0

  end
end
