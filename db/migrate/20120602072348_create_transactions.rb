class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :message
      t.string :personal_message
      t.integer :photo
      t.integer :friend_id
      t.string :friend_network

      t.timestamps
    end
  end
end
