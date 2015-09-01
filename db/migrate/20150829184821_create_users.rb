class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.text :about_me
      t.string :avatar
      t.string :twitter
      t.timestamps null: false
    end
  end
end
