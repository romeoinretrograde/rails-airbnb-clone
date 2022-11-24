class AddAddressToPigs < ActiveRecord::Migration[7.0]
  def change
    add_column :pigs, :address, :string
  end
end
