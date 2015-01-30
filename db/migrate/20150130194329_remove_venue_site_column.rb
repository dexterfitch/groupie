class RemoveVenueSiteColumn < ActiveRecord::Migration
  def change
    remove_column :venues, :venue_site
  end
end
