class AddFeaturesToApps < ActiveRecord::Migration[6.1]
  def change
    add_column :apps, :features, :text
  end
end
