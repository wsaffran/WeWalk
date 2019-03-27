class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :content
      t.integer :walker_id
      t.integer :walkee_id
      t.timestamps
    end
  end
end
