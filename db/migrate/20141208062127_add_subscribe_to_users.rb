class AddSubscribeToUsers < ActiveRecord::Migration
  def change
add_column :users, :subscribe, :boolean, :default => false
  end
end
