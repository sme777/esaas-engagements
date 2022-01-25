class AddMatchingIdToEngagements < ActiveRecord::Migration[6.1]
  def change
    add_column :engagements, :matching_id, :integer
  end
end
