require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# ---------------------------------------------

get('/') do
  @venues = Venue.all()
  erb(:index)
end

get('/venues/:id') do
  @venue = Venue.find(params["id"].to_i())
  erb(:venue)
end

post('/venues') do
  venue_name = params["venue_name"]
  Venue.create({:venue_name => venue_name})
  redirect("/")
end

# ---------------------------------------------

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

get('/bands/:id') do
  @band = Band.find(params["id"].to_i())
  @venues = Venue.all()
  erb(:band)
end

get('/bands/:id/edit') do
  @band = Band.find(params["id"].to_i())
  erb(:band_edit)
end

post('/bands') do
  band_name = params["band_name"]
  Band.create({:band_name => band_name})
  redirect("/bands")
end

patch('/bands/:id') do
  band_name = params["band_name"]
  @band = Band.find(params["id"].to_i())
  band_id = @band.id()
  @band.update({:band_name => band_name})
  redirect("/bands/#{band_id}")
end

delete('/bands/:id') do
  @band = Band.find(params["id"].to_i())
  band_id = @band.id()
  @band.destroy()
  redirect("/bands")
end

# ---------------------------------------------

post('/bands_venues') do
  band_id = params["band_id"]
  band = Band.find(band_id)
  band_venues = band.venues()
  venue_ids = params["venue_ids"]
  venue_ids.each() do |venue_id|
    venue = Venue.find(venue_id)
    if !band_venues.include?(venue)
      band.venues << venue
    end
  end
  redirect("/bands/#{band_id}")
end
