class AddFeaturesToEngagements < ActiveRecord::Migration[6.1]
  def change
    add_column :engagements, :features, :string
  end
end
