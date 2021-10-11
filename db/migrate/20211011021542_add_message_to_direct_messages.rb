class AddMessageToDirectMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :direct_messages, :message, :string
  end
end
