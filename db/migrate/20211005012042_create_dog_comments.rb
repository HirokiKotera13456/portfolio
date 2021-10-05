class CreateDogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :dog_id

      t.timestamps
    end
  end
end
