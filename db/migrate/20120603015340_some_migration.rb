class SomeMigration < ActiveRecord::Migration
  def up
    remove_column :users, :name
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    create_table :pay_levels do |t|
      t.integer  :amount_in_cents
      t.string  :photo_url
      t.string  :description
      t.integer :message
      t.integer :name
    end
  end

  def down
  end
end
