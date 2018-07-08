class CreateSolTags < ActiveRecord::Migration[5.2]
  def change
    create_table :sol_tags do |t|
      t.references :sol, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
