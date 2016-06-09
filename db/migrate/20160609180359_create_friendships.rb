class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :account, index: true, foreign_key: true
      t.references :friend, index: true

      t.timestamps null: false
    end

    add_foreign_key :friendships, :accounts, column: :friend_id
    add_index :friendships, [:account_id, :friend_id], unique: true
  end
end
