class FixPaperClipColumns < ActiveRecord::Migration
  def change
    drop_table "users"

    create_table "users" do |t|
      t.string   "user_name"
      t.string   "password_digest"
      t.text     "about_me"
      t.string   "avatar"
      t.string   "twitter"
      t.datetime "created_at",          null: false
      t.datetime "updated_at",          null: false
      t.attachment "avatar"    
    end
  end
end
