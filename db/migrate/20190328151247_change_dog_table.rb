class ChangeDogTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :hypo_allergenic
    add_column :dogs, :image, :string
  end
end
