class Rename < ActiveRecord::Migration
  def up
    add_column :users, :new_facebook_id, :string
    execute("update users set new_facebook_id = facebook_id")
    remove_column :users, :facebook_id
    add_column :users, :facebook_id, :string
    execute("update users set facebook_id = new_facebook_id")
    remove_column :users, :new_facebook_id
  end

  def down
  end
end
