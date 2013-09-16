require 'faker'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'

band_name = Faker::Lorem.word
num_albums = rand(1..10)
lead_singer  = Faker::Name.name
album_names = Faker::Company.bs
age = rand(19..80)

def run_sql(sql)
	conn = PG.connect(:dbname => 'fav_bands', :host => 'localhost')
	res = conn.exec(sql)
	conn.close
	res
end


1000.times do
	sql = "INSERT INTO band (band_name, num_albums, lead_singer, album_names) VALUES ('#{band_name}', '#{num_albums}', '#{lead_singer}', '#{album_names}');" 	

	run_sql(sql)

	sql2 = "INSERT INTO lead_singer (lead_singer, age) VALUES ('#{lead_singer}', '#{age}');"
	
	run_sql(sql2)

end



