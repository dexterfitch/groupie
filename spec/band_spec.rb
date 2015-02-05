require('spec_helper')

describe(Band) do
  it{ should have_and_belong_to_many(:venues) }
  it{ should validate_presence_of(:band_name) }
  it{ should ensure_length_of(:band_name).is_at_most(60) }
  it{ should validate_uniqueness_of(:band_name) }

  describe(:titlecase_band_name) do
    it("will titlecase the band names") do
      band1 = Band.create({:band_name => "stabby lambda and the hash rockets"})
      expect(band1.band_name()).to(eq("Stabby Lambda And The Hash Rockets"))
    end
  end

  describe('default scope') do
    let!(:band1) { Band.create(band_name: "Chilled") }
    let!(:band2) { Band.create(band_name: "Animals") }

    it("orders A-Z") do
      expect(Band.all).to(eq([band2, band1]))
    end
  end

end
