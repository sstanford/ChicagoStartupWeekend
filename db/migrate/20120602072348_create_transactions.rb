class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :amount_in_cents
      t.string  :text
      t.string  :photo
      t.integer :payer_user_id
      t.integer :payee_user_id
      t.string  :status
      t.timestamps
    end

    create_table :transaction_details do |t|
      t.string  :status
      t.integer :user_id
      t.integer :transaction_id
      t.integer :payee_user_id
      t.integer :amount_in_cents
      t.string  :confirmation_number
      t.string  :processor
      t.timestamps
    end

    create_table :users do |t|
      t.boolean   :pending
      t.integer :facebook_id
      t.string  :name
      t.string  :email
      t.timestamps
    end

  end
end
