class DeleteTests < ActiveRecord::Migration[5.2]
  def change
    drop_table(:tests)
  end
end
