class RenameColumnTitleToTitleToQuestions < ActiveRecord::Migration
  def up
    rename_column :questions, :Title, :title
  end

  def down
    rename_column :questions, :title, :Title
  end
end
