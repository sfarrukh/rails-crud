class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 30
      t.string "email", :limit => 40
      t.string "password_digest"

      t.timestamps
    end
  end
end
