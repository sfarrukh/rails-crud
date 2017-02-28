class AddPasswordDigestToCustomer < ActiveRecord::Migration[5.0]
  def up
  	add_column("customer", "password_digest", :string, :after => "username")
  end

  def down
  	remove_column("customer", "password_digest")
  end
end
