class AddCommentTypeToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :comment_type, :integer
  end
end
