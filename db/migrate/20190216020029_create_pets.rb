class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :pet_avatar
      t.string :name
      t.integer :age
      t.string :type
      t.string :breed

      t.timestamps
    end
  end
end
