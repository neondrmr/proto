class ChangeUserNameToBeRequired < ActiveRecord::Migration
  def change
    change_column :users, :user_name, :string, :default => '', :null => false
  end
end
