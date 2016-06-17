#!/usr/bin/env ruby
#
# this function is used when adding ldap-schema-ldif-file 
# attributes or objectClasses manually
# olc ldap number plus one all {n} numbers

@file = nil

def search_line(line)
  # puts line
  if line.match(/^olcAttributeTypes: \{/)
    tmp_number = line.match(/\{[0-9]+\}/)
    end_string = line.match(/\}.+/)

    number = tmp_number.to_s.match(/[0-9]+/)
    new_number = number.to_s.to_i + 1
    
    puts 'olcAttributeTypes: {' + new_number.to_s + end_string.to_s
  elsif line.match(/olcObjectClasses: \{/)
    tmp_number = line.match(/\{[0-9]+\}/)
    end_string = line.match(/\}.+/)
    
    number = tmp_number.to_s.match(/[0-9]+/)
    new_number = number.to_s.to_i + 1
    
    puts 'olcObjectClasses: {' + new_number.to_s + end_string.to_s
    
  else
    puts line
  end 

end

if ARGV.length == 1
  
  if File.exists?(ARGV[0])
    file = File.open(ARGV[0])
    file.each {|line|
      search_line(line)
    }
  else
    puts "no file at path"
  end
else
  puts "you must give a path to a schema converted .ldif file"
end