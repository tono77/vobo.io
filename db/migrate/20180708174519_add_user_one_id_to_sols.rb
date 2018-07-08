class AddUserOneIdToSols < ActiveRecord::Migration[5.2]
  def change
    add_column :sols, :user_one_id, :integer
  end
end
