class CreateConferences < ActiveRecord::Migration[5.2]
  def change
    create_table :conferences do |t|
      t.string :region
      t.boolean :power_five
      t.string :name
      t.integer :national_champions

      t.timestamps
    end
  end
end
