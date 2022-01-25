class ChangeDefaultStatusofApp < ActiveRecord::Migration[6.1]
  def change
  	change_column_default :apps, :status, 5
  end
end
