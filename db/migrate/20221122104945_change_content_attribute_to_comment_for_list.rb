class ChangeContentAttributeToCommentForList < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :content, :comment
  end
end
