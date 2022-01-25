class AddGeneralFeedbackToIterations < ActiveRecord::Migration[6.1]
  def change
    add_column :iterations, :general_feedback, :string
  end
end
