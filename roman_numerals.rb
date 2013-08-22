#!/usr/bin/ruby
#
# Convert to and from Roman Numerals

require "StringExtensions.rb"

def print_four_or_nine(num)
	if num == 4
		print "IV"
	elsif num == 9
		print "IX"
	end
end

def	convert_one_num(num)
	if num < 4
		num.times do
			print "I"
		end
	elsif num > 5 && num < 9
		print "V"
		num = num - 5
		num.times do
			print "I"
		end
	elsif num == 5
		print "V"
	else
		print_four_or_nine(num)
	end
	print "\n"
end

def convert_two_num(num)
	one, two = num.to_s.split('')
	if one.to_i < 4
		one.to_i.times do
			print "X"
		end
	elsif one.to_i == 4
		print "XL"
	elsif one.to_i == 5
		print "L"
	elsif one.to_i > 5 && one.to_i < 9
		one = one.to_i - 5
		print "L"
		one.times do
			print "X"
		end
	elsif one.to_i == 9
		print "XC"
	end
	convert_one_num(two.to_i)
end

def convert_three_num(num)
	one, two, three = num.to_s.split('')
	two_three = two + three
	if one.to_i < 4
		one.to_i.times do
			print "C"
		end
	elsif one.to_i == 4
		print "CD"
	elsif one.to_i == 5
		print 500
	elsif one.to_i > 5 && one.to_i < 9
		one = one.to_i - 5
		print "D"
		one.times do
			print "C"
		end
	elsif one.to_i == 9
		print "CM"
	end
	convert_two_num(two_three)
end

def convert_four_num(num)
	one, two, three, four = num.to_s.split('')
	two_three_four = two + three + four
	if one.to_i < 4
		one.to_i.times do
			print("M")
		end
	elsif one.to_i >= 4
		puts "Numbers over 3999 is out of range for this converter"
		return
	end
	convert_three_num(two_three_four)
end

if ARGV[0].numeric?
	arabic = ARGV[0].length
	number = ARGV[0]
	if arabic == 1
		convert_one_num(number.to_i)
	elsif arabic == 2
		convert_two_num(number)
	elsif arabic == 3
		convert_three_num(number)
	elsif arabic == 4
		convert_four_num(number)
	end
else
	puts "got Letter " + ARGV[0].length.to_s
end
