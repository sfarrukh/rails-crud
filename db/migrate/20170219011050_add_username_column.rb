class AddUsernameColumn < ActiveRecord::Migration[5.0]
  def up
  	add_column("admins", "username", :string, :limit => 30, :after => 'last_name')
  end
end
