class AddRepoUrlToEngagements < ActiveRecord::Migration[6.1]
  def change
  	add_column :engagements, :repository_url, :string
  end
end
