require 'sinatra'
require 'sinatra/reloader'
require 'active_support/all'
require 'active_record'

ActiveRecord::Base.establish_connection(ENV['HEROKU_POSTGRESQL_BROWN_URL'] 

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_relative './models/band'
require_relative './models/band_member'
	
before do
	@all_bands = Band.all
	
end

get '/' do
	erb :index
end

get '/bands/new' do
	erb :new_band
end

post '/bands/new' do
	 Band.create(params[:band])

	 redirect '/'
end


get '/bands/:id/edit' do
	id = params[:id]
	@band = Band.find(id)

	erb :edit_band
end

post '/bands/:id/edit' do
	id = params[:id]
	Band.update(id, params[:band])	
	redirect '/'
end

get '/bands/:bands_id/new_member' do
	@bands_id = params[:bands_id]

	erb :new_member
end

post '/bands/:bands_id/new_member' do
	current_band = Band.find(params[:bands_id])
	band_member = current_band.band_members.new(params[:band_member])
	band_member.save
	redirect '/'
end

get '/bands/:id/delete' do  
	band = Band.find(params[:id])

	band.band_members.each do |x|
		x.destroy
	end

	band.destroy

	redirect '/'
end





