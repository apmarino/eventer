class ChangeUserUniqUsername < ActiveRecord::Migration
  def change
    change_column :users, :user_name, :string, :unique => true
  end
end
