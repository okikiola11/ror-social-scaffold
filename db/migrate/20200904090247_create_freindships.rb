class CreateFreindships < ActiveRecord::Migration[5.2]
  def change
    create_table :freindships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :friend, index: true
      t.boolean :confirmed

      t.timestamps null: false
    end
    add_foreign_key :freindships, :users, column: :friend_id
  end
end
