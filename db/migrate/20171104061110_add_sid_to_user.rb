class AddSidToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :sid, :string
  end
end
