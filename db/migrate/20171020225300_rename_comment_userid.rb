class RenameCommentUserid < ActiveRecord::Migration[6.1]
  def change
  		rename_column :comments, :userid, :user_id
  end
end
