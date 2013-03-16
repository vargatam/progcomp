class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.references :problem
      t.references :user
      t.string :solution
      t.boolean :is_correct
      t.integer :score

      t.timestamps
    end
    add_index :solutions, :problem_id
    add_index :solutions, :user_id
  end
end
