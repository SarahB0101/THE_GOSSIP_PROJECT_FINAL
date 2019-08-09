class RemoveCommentDeleteParent < ActiveRecord::Migration[5.2]
  def change
  	remove_column :comments, :parent_id
  	remove_column :comments, :parent_type
  end
end
