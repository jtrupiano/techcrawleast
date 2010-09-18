class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.integer :year
      t.date :date
    end
    add_column :presenters, :event_id, :int, :null => false
    add_foreign_key(:presenters, :events)
  end

  def self.down
    remove_foreign_key :presenters, :column => :event_id
    remove_column :presenters, :event_id
    drop_table :events
  end
end
