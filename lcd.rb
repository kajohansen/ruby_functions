#!/usr/bin/ruby
#
# Display lcd numbers
# We can use the colorize gem to set color's
# print blik effects or underlines
# or we can use the String Extension class to print color's in bold..

# require 'rubygems'
# require 'colorize'

require 'StringExtensions.rb'

def num_to_lcd1(num)
	if num == 1 || num == 4
		print "    "
	else
		print " -- ".bold.green
	end
end

def num_to_lcd23(num)
	if num == 0 || num == 8 || num == 9 || num == 4
		print "|  |".bold.green
	elsif num == 2 || num == 3 || num == 7
		print "   |".bold.green
	elsif num == 5 || num == 6
		print "|   ".bold.green
	elsif num == 1
		print "  | ".bold.green
	end
end

def num_to_lcd4(num)
	if num > 1 && num < 7
		print " -- ".bold.green
	elsif num > 7
		print " -- ".bold.green
	elsif num == 0 || num == 7 || num == 1
		print "    "
	end
end

def	num_to_lcd56(num)
	if num == 0 || num == 6 || num == 8
		print "|  |".bold.green
	elsif num == 1
		print "  | ".bold.green
	elsif num == 2
		print "|   ".bold.green
	elsif num == 3 || num == 4 || num == 5 || num == 7 || num == 9
		print "   |".bold.green
	end
end

def num_to_lcd7(num)
	if num == 0 || num == 2 || num == 3 || num == 5 || num == 6 || num == 8 || num == 9
		print " -- ".bold.green
	elsif num == 4 || num == 7 || num == 1
		print "    ".bold.green
	end
end

if ARGV.length > 0
	number = ARGV[0]
	number_array = number.to_s.split('')
	number_array.each do |num|
		num_to_lcd1(num.to_i)
	end
	print "\n"
	2.times do
		number_array.each do |num|
			num_to_lcd23(num.to_i)
		end
		print "\n"
	end
	number_array.each do |num|
		num_to_lcd4(num.to_i)
	end
	print "\n"
	2.times do
		number_array.each do |num|
			num_to_lcd56(num.to_i)
		end
		print "\n"
	end
	number_array.each do |num|
		num_to_lcd7(num.to_i)
	end
else
	puts "You must enter a number as an argument..".red
end

