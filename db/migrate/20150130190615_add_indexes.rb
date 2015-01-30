class AddIndexes < ActiveRecord::Migration
  def change
    def self.up
      add_index :bands_venues, :bands_id
      add_index :bands_venues, :venues_id
      add_index :bands, :band_name
      add_index :venues, :venue_name
    end

    def self.down
      remove_index :bands_venues, :bands_id
      remove_index :bands_venues, :venues_id
      remove_index :bands, :band_name
      remove_index :venues, :venue_name
    end
  end
end
