require('spec_helper')

describe(Venue) do
  it{ should have_and_belong_to_many(:bands) }
  it{ should validate_presence_of(:venue_name) }
  it{ should ensure_length_of(:venue_name).is_at_most(70) }
  it{ should validate_uniqueness_of(:venue_name) }

  describe(:titlecase_venue_name) do
    it("will titlecase the venue names") do
      venue1 = Venue.create({:venue_name => "red emma's"})
      expect(venue1.venue_name()).to(eq("Red Emma's"))
    end
  end

  describe('default scope') do
    let!(:venue1) { Venue.create(venue_name: "Stratosphere") }
    let!(:venue2) { Venue.create(venue_name: "Crystal Ballroom") }

    it("orders A-Z") do
      expect(Venue.all).to(eq([venue2, venue1]))
    end
  end

end
