#!/usr/bin/env ruby

require 'geocoder'
require 'pp'

location = Geocoder.search("Waldemar Aunes vei 9a, Trondheim")
#puts location.inspect
pp(location)
