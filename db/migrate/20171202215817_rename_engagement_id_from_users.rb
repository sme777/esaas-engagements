class RenameEngagementIdFromUsers < ActiveRecord::Migration[6.1]
  def change
  	rename_column :users, :engagement_id, :developing_engagement_id
  end
end
