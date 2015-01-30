class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates(:venue_name, { :presence => true, :length => { maximum: 70 }, :uniqueness => { :case_sensitive => false } })
  before_save(:titlecase_venue_name)

  Venue.order('venue_name')

  default_scope { order('venue_name') }

  private

  define_method(:titlecase_venue_name) do
    self.venue_name = (venue_name().titlecase())
  end

end
