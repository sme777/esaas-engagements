class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :username
      t.string :content
      t.datetime :when

      t.timestamps null: false
    end
  end
end
