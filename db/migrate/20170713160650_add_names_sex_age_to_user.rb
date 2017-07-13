class AddNamesSexAgeToUser < ActiveRecord::Migration
  def change
     add_column :users, :sex, :boolean
     add_column :users, :nameUsers, :string
     add_column :users, :birthDate, :string
     add_column :users, :aboutYou, :string
  end
end
