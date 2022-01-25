class RemoveWhenFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :when, :datetime
  end
end
