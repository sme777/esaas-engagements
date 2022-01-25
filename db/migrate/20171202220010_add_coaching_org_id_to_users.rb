class AddCoachingOrgIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :coaching_org_id, :integer
  end
end
