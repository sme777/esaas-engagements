class AddReferencesToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :engagement, index: true, foreign_key: true
  end
end
