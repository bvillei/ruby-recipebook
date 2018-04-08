class AddSaltToUsers < ActiveRecord::Migration[5.1]
  def up
    # def change
    # reversible do |dir|
    #   dir.up
    add_column :users, :salt, :string
    rename_column :users, :password, :encrypted_password
    # end
  end

  def down
    remove_column :users, :salt
    rename_column :users, :encrypted_password, :password
  end
end
