class CreateRentalPendings < ActiveRecord::Migration[5.0]
  def up
    create_table :rental_pendings do |t|
			t.integer "customer_id"
      t.integer "film_id"
			t.boolean "shipped", :default => false
	    t.timestamps
    end
  end

  def down
  	drop_table :rental_pendings
  end
end
