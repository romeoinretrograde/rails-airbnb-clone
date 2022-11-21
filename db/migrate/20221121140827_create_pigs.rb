class CreatePigs < ActiveRecord::Migration[7.0]
  def change
    create_table :pigs do |t|
      t.string :name
      t.integer :age
      t.text :details
      t.string :breed
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
