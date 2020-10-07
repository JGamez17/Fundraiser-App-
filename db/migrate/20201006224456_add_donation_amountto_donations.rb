class AddDonationAmounttoDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :donation_amount, :integer
  end
end
