class SomeMigration < ActiveRecord::Migration
  def up
    remove_column :users, :name
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    remove_column :transactions, :text
    remove_column :transactions, :photo
    add_column :transactions, :description, :string
    add_column :transactions, :message, :string
    add_column :transactions, :photo_url, :string
    add_column :transactions, :pay_level_id, :integer

    create_table :pay_levels do |t|
      t.integer  :amount_in_cents
      t.string  :photo_url
      t.string  :description
      t.string  :message
      t.string  :name
    end
  end
end
