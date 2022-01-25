class AddPhoneToOrgs < ActiveRecord::Migration[6.1]
  def change
    add_column :orgs, :phone, :string, :null => true, :default => nil
  end
end
