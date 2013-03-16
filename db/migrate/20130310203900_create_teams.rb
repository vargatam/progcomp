class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :number
      t.references :competition

      t.timestamps
    end
    add_index :teams, :competition_id
  end
end
