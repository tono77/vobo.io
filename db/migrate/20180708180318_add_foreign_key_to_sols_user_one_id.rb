class AddForeignKeyToSolsUserOneId < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :sols, :users, column: :user_one_id
  	add_foreign_key :sols, :users, column: :user_two_id
  end
end
