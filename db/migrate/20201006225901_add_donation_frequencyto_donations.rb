class AddDonationFrequencytoDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :donation_frequency, :integer
  end
end
