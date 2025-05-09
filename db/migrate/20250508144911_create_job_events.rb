class CreateJobEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :job_events do |t|
      t.belongs_to :job, null: false, foreign_key: true
      t.string :event_type, null: false
      t.json :payload
      t.timestamps
    end
  end
end
