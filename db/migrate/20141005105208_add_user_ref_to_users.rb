class AddUserRefToUsers < ActiveRecord::Migration
  def change
    #add_column :users, :paired_user_id, :integer, references: :users
  end
end
