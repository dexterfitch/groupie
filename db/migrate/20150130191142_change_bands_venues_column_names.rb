class ChangeBandsVenuesColumnNames < ActiveRecord::Migration
  def change
    rename_column :bands_venues, :bands_id, :band_id
    rename_column :bands_venues, :venues_id, :venue_id
  end
end
