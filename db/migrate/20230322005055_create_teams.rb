class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :school_name
      t.string :mascot
      t.integer :rank
      t.boolean :private
      t.references :conference, foreign_key: true
      
      t.timestamps
    end
  end
end
