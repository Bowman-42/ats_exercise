class CreateApplicationEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :application_events do |t|
      t.belongs_to :application, null: false, foreign_key: true
      t.string :event_type, null: false
      t.json :payload
      t.timestamps
    end
  end
end
