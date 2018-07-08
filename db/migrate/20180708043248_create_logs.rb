class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :ope
      t.text :log
      t.references :sol, foreign_key: true

      t.timestamps
    end
  end
end
