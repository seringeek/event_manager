class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :event_date
      t.string :short_desc
      t.text :about
      t.string :photo
      t.decimal :ticket_fee, :precision =>16, :scale =>2
      t.string :created_from
      t.timestamps
    end
  end
end
