class User < ActiveRecord::Migration
  def change
    add_index :users, :phonenumber, { unique: true }
    add_index :users, :gcm_id, { unique: true }
  end
end
