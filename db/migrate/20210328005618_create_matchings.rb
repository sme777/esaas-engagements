class CreateMatchings < ActiveRecord::Migration[6.1]
  def change
    create_table :matchings do |t|
      t.timestamps null: false
      t.string :name
      t.text :projects
      t.text :preferences
      t.text :description
      t.text :result
      t.string :status, null: false, default: 'Collecting responses'
      t.text :last_edit_users
      t.datetime :last_edit_time
    end
  end
end
