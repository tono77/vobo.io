class AddUserTwoIdToSols < ActiveRecord::Migration[5.2]
  def change
    add_column :sols, :user_two_id, :integer
  end
end
