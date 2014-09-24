class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phonenumber
      t.string :gcm_id

      t.timestamps
    end
  end
end
