class CreateContests < ActiveRecord::Migration[6.0]
  def change
    create_table :contests do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.references :user, null: false, foreign_key: true
    end
  end
end
