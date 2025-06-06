class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.text :description
      t.string :status, null: false, default: "deactivated"

      t.timestamps
    end
    add_index :jobs, :status
  end
end
