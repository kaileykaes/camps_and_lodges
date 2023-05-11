class AddCampsToLodges < ActiveRecord::Migration[7.0]
  def change
    add_reference :lodges, :camp, null: false, foreign_key: true
  end
end
