class CreatePresenters < ActiveRecord::Migration
  def self.up
    create_table :presenters do |t|
      t.string :name, :size => 50
      t.string :primary_contact, :size => 50
      t.string :primary_contact_email
      t.string :primary_contact_phone_number, :size => 20
      t.string :location
      t.text :short_description
      t.string :website
    end
  end

  def self.down
    drop_table :presenters
  end
end
