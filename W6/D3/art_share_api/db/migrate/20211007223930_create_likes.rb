class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :liker_id, null: false
      t.references :likeable, polymorphic: true
      t.timestamps
    end

    add_index :likes, :liker_id
  end
end
