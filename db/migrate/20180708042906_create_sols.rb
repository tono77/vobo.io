class CreateSols < ActiveRecord::Migration[5.2]
  def change
    create_table :sols do |t|
      t.text :title
      t.text :desc
      t.references :user, foreign_key: true
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
