class AddCommentsToOrgsAndApps < ActiveRecord::Migration[6.1]
  def change
    add_column :orgs, :comments, :text, :null => true, :default => nil
    add_column :apps, :comments, :text, :null => true, :default => nil
  end
end
