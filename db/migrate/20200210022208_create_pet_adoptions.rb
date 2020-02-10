class CreatePetAdoptions < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_adoptions do |t|
      t.references :pet, foreign_key: true
      t.references :adoption, foreign_key: true
    end
  end
end
