class UpdateUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :username, :user_name
  end
end
