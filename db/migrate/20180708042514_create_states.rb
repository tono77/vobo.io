class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :code
      t.text :desc

      t.timestamps
    end
  end
end
