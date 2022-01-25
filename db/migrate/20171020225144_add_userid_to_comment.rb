class AddUseridToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :userid, :integer
  end
end
