class UpdatePolls < ActiveRecord::Migration[5.2]
  def change
    remove_column :polls, :user_id
    add_column :polls, :user_id, :integer, null:false
  end
end
