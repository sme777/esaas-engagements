class AddTrackerColumnToApp < ActiveRecord::Migration[6.1]
  def change
    add_column :apps, :pivotal_tracker_url, :string
  end
end
