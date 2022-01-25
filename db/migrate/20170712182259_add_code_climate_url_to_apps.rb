class AddCodeClimateUrlToApps < ActiveRecord::Migration[6.1]
  def change
    add_column :apps, :code_climate_url, :string, :null => true, :default => nil
  end
end
