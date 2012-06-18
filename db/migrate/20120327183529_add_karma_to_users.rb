class AddKarmaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :karma, :integer
  end
end
