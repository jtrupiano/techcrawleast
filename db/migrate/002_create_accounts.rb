class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :email 
      t.string :name 
      t.string :surname
      t.string :salt
      t.string :crypted_password
      t.string :role
    end
  end

  def self.down
    drop_table :accounts
  end
end
