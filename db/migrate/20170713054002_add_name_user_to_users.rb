class AddNameUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nameUser, :string
  end
end
