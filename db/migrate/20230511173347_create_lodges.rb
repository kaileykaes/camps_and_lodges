class CreateLodges < ActiveRecord::Migration[7.0]
  def change
    create_table :lodges do |t|
      t.string :name
      t.string :director
      t.integer :number_of_staff
      t.boolean :specialty_area

      t.timestamps
    end
  end
end
