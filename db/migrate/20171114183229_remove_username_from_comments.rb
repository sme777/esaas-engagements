class RemoveUsernameFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :username, :string
  end
end
