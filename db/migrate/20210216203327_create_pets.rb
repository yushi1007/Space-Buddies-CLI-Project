class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.integer :breed_id
      t.string :name
      t.string :bio
    end
  end
end
