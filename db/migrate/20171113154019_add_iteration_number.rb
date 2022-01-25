class AddIterationNumber < ActiveRecord::Migration[6.1]
  def change
    add_column :iterations, :number, :string
  end
end
