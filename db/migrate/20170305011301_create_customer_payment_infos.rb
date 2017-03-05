class CreateCustomerPaymentInfos < ActiveRecord::Migration[5.0]
  def up
    create_table :customer_payment_infos do |t|
    	t.integer "customer_id", :limit => 5
    	t.string "card_number", :limit => 20
    	t.integer "ccv_number", :limit => 3
    	t.string "exp_date"
      t.timestamps
    end
  end

  def down
  	drop_table :customer_payment_infos
  end
end
