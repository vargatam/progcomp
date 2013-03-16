class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :number
      t.string :title
      t.text :text
      t.references :competition
      t.references :parent
      t.string :solution
      t.string :solution_type
      t.integer :point

      t.timestamps
    end
    add_index :problems, :competition_id
    add_index :problems, :parent_id
  end
end
