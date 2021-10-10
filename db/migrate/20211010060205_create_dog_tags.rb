class CreateDogTags < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_tags do |t|
      t.references :dog, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
