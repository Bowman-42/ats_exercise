class CreateApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :applications do |t|
      t.belongs_to :job, null: false, foreign_key: true
      t.string :candidate_name, null: false
      t.string :status, null: false, default: "applied"
      t.integer :notes, null: false, default: 0
      t.date :last_interview

      t.timestamps
    end
    add_index :applications, :status
  end
end
