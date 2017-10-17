class CreateDrafts < ActiveRecord::Migration[5.1]
  def change
    create_table :drafts do |t|
      t.integer :planner_id
      t.integer :trip_id
      t.string :name

      t.timestamps
    end
  end
end
