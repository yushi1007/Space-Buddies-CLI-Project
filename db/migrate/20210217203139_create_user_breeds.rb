class CreateUserBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :user_breeds do |t|
      t.integer :user_id
      t.integer :breed_id
    end
  end
end
