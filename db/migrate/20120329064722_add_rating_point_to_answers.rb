class AddRatingPointToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :rating_point, :integer, :default => 0

  end
end
