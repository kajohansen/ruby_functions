#!/usr/bin/ruby
#
# IP Location
require 'geokit'

if ARGV.length == 1
	puts "Echoing ip location"
	location = Geokit::Geocoders::MultiGeocoder.geocode(ARGV[0])
	if location.country
		puts "Country :" + location.country
	end
	if location.country_code
		puts "Country :" + location.country_code
	end
	if location.city
		puts "City    :" + location.city
	end	
	if location.state
		puts "State   :" + location.state
	end
	if location.ll
		puts "Lat/Lng :" + location.ll
	end
else
	puts "You have to provide one ip address"
end
