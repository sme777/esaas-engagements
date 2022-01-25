class AddDefunctToOrgs < ActiveRecord::Migration[6.1]
  def change
    add_column :orgs, :defunct, :boolean, :null => true, :default => false
  end
end
