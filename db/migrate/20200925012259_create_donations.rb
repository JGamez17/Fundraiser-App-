class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :raffle_id
      t.integer :number_of_tickets

      t.timestamps
    end
  end
end
