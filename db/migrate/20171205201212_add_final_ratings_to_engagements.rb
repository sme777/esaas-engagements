class AddFinalRatingsToEngagements < ActiveRecord::Migration[6.1]
  def change
    add_column :engagements, :final_rating, :string
    add_column :engagements, :final_comments, :string
  end
end
