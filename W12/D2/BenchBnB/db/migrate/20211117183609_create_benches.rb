class CreateBenches < ActiveRecord::Migration[5.2]
  def change
    create_table :benches do |t|

      t.timestamps
    end
  end
end
