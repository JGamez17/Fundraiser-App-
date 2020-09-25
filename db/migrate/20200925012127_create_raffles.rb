class CreateRaffles < ActiveRecord::Migration[6.0]
  def change
    create_table :raffles do |t|
      t.integer :ticket_price
      t.string :name_of_raffle

      t.timestamps
    end
  end
end
