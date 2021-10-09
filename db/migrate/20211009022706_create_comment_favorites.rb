class CreateCommentFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_favorites do |t|
      t.integer :user_id
      t.integer :dog_comment_id
      t.integer :dog_id

      t.timestamps
    end
  end
end
