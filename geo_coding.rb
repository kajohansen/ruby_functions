#!/usr/bin/ruby
#
# Geo Coding
require 'bigdecimal'

def LatLngToDecimal(deg, min, sec, cardinal)
  # puts "LatLnt to decimal called"
  @decimal_min = min / 60.0
  @decimal_sec = sec.to_f / 3600
  @decimal = deg + @decimal_min + @decimal_sec
  @cardinal = cardinal.upcase
  case @cardinal
  when "N"
    puts @decimal.to_s + " North"
    return
  when "S"
    puts @decimal.to_s + " South"
    return
  when "E"
    puts @decimal.to_s + " East"
    return
  when "W"
    puts @decimal.to_s + " West"
    return
  end
  puts "Error"
end

def DecimalToLatLng(decimal_deg, lat_lng)
  @lat_lng = lat_lng.downcase
  @decimal_deg_str = decimal_deg.to_s
  @degrees, match, @decimal = @decimal_deg_str.rpartition('.')
  
  @decimal_minute = "0." + @decimal
  @min_sixty = @decimal_minute.to_f * 60
  @minutes = @min_sixty.to_i
  
  trash, match, @decimal_sec_str = @min_sixty.to_s.rpartition('.')
  @decimal_second = "0." + @decimal_sec_str
  @sec_sixty = @decimal_second.to_f * 60
  # @second1, match, @second2 = @sec_sixty.to_s.rpartition('.')
  # @second2 = @second2[0,2]
  # @seconds = @second1 + "." + @second2
  @seconds = @sec_sixty.to_s[0,5]
  
  if (@lat_lng == "lat")
    lat_lng = "Lat: "
    if (@decimal_deg_str[0,1] == "-")
      @cardinal = "S"
    else
      @cardinal = "N"
    end
  elsif (@lat_lng == "lng")
    lat_lng = "Lng: "
    if (@decimal_deg_str[0,1] == "-")
      @cardinal = "W"
    else
      @cardinal = "E"
    end
  end
  
  puts lat_lng + " " + @degrees + "° " + @minutes.to_s + "' " + @seconds.to_s + "' " + @cardinal
end

if ARGV.length == 4
  deg = ARGV[0]
  min = ARGV[1]
  sec = ARGV[2]
  cardinal = ARGV[3]
  LatLngToDecimal(deg.to_f, min.to_f, sec.to_f, cardinal.to_s)
elsif ARGV.length == 2
  deg = ARGV[0]
  lat_lng = ARGV[1]
  DecimalToLatLng(deg, lat_lng)
else
  puts "You can either put decimal latitude or longitude"
  puts " -- example1: 51.17926388888888 Lat"
  puts " -- example2: -1.8262 Lng"
  puts "-- Or --"
  puts "You can put degrees minutes seconds and cardinal direction"
  puts " -- example: 19 18 6 n"
end


# LatLngToDecimal(19, 18, 6, "n")
# LatLngToDecimal(51, 10, 45.35, "s")
# DecimalToLatLng(51.17926388888888, "LAt")
# DecimalToLatLng(-1.8262166666666666, "LnG")
