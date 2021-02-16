class CreateUserPets < ActiveRecord::Migration[5.2]
  def change
    create_table :user_pets do |t|
      t.integer :user_id
      t.integer :pet_id
    end
  end
end
