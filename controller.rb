require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require('json')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')

get '/homepage' do
  erb(:home)
end

get '/artists/new' do
  erb(:'artist/new')
end

get '/artists' do
  @artists = Artist.all
  erb(:'artist/index')
end

post '/artists' do
  @artist = Artist.new(params)
  @artist.save()
  erb(:'artist/create')
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb(:'artist/show')
end

get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb(:'artist/edit')
end

put '/artists/:id' do
  @artist = Artist.update(params)
  redirect to ("/artists")
end

delete '/artists/:id' do
  @artist = Artist.destroy(params[:id])
  redirect to ("/artists")
end

get '/albums/new' do
  @artists = Artist.all()
  erb(:'album/new')
end

get '/albums' do
  @albums = Album.all
  erb(:'album/index')
end

post '/albums' do
  @album = Album.new(params)
  @album.save()
  erb(:'album/create')
end

get '/albums/:id' do
  @album = Album.find(params[:id])
  erb(:'album/show')
end

get '/albums/:id/edit' do
  @album = Album.find(params[:id])
  erb(:'album/edit')
end

put '/albums/:id' do
  @album = Album.update(params)
  redirect to ("/albums")
end

delete '/albums/:id' do
  @album = Album.destroy(params[:id])
  redirect to ("/albums")
end
