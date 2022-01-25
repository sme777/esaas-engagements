class AddSemesterToIterations < ActiveRecord::Migration[6.1]
  def change
    add_column :engagements, :semester, :string
  end
end
