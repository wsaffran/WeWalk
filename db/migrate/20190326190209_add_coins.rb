class AddCoins < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :tokens, :integer
  end
end
