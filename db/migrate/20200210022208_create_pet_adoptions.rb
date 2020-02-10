class CreatePetAdoptions < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_adoptions do |t|
      t.references :pets, foreign_key: true
      t.references :adoptions, foreign_key: true
    end
  end
end
