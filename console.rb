require_relative( './models/album' )
require_relative( './models/artist' )

require( 'pry-byebug' )

artist1 = Artist.new( { 'name' => 'Oasis' } ).save();
album1 = Album.new( { 'name' => 'Roll With It', 'artist_id' => artist1.id } ).save();
album2 = Album.new( { 'name' => 'Another album', 'artist_id' => artist1.id } ).save();


# binding.pry
# nil
