class CreateTables < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:band_name, :string)
      t.timestamp
    end

    create_table(:venues) do |t|
      t.column(:venue_name, :string)
      t.column(:venue_site, :string)
      t.timestamp
    end

    create_table(:bands_venues) do |t|
      t.column(:bands_id, :integer)
      t.column(:venues_id, :integer)
    end
  end
end
