#!/usr/bin/env ruby

require 'geocoder'
require 'pp'

#location = Geocoder.search("Waldemar Aunes vei 9a, Trondheim")
#result = location[0]
#puts location.inspect
#pp(location)
#puts result.formatted_address

search_string = ""
ARGV.each { |val| search_string += "#{val} " }

location = Geocoder.search(search_string)
result = location[0]
puts result.formatted_address

#puts search_string
puts 'Lat ' + result.geometry['location']['lat'].to_s
puts 'Lng ' + result.geometry['location']['lng'].to_s
