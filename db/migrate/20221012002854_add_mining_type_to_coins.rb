class AddMiningTypeToCoins < ActiveRecord::Migration[7.0]
  def change
    # rails g migration AddMiningTypeToCoins mining_type:refereces
    add_reference :coins, :mining_type, foreign_key: true
  end
end
