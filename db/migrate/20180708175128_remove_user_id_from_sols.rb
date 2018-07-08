class RemoveUserIdFromSols < ActiveRecord::Migration[5.2]
  def change
    remove_column :sols, :user_id, :bigint
  end
end
