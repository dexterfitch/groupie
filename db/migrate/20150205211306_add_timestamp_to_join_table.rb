class AddTimestampToJoinTable < ActiveRecord::Migration
  def change_table
    add_timestamps(:bands_venues)
  end
end
