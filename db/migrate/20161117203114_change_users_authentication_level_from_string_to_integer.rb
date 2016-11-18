class ChangeUsersAuthenticationLevelFromStringToInteger < ActiveRecord::Migration
  def change

  	remove_column :users, :authentication_level, :string
  	remove_column :users, :authenticate_level, :string
  	add_column :users, :authentication_level, :integer, default: 1

  end
end
