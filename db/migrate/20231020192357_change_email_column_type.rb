class ChangeEmailColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :emails, :from, :text
  end
end
