#!/usr/bin/ruby
#
# Convert to and from Roman Numerals

root_dir = File.dirname(__FILE__)
require root_dir + "/" + "StringExtensions.rb"

def	convert_one_num(num)
	if num < 4
		num.times do
			print "I"
		end
	elsif num == 4
		print "IV"
	elsif num > 5 && num < 9
		print "V"
		num = num - 5
		num.times do
			print "I"
		end
	elsif num == 5
		print "V"
	elsif num == 9
		print "IX"
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

@romans_dict = {"I" => 1, "IV" => 4, 
								"V" => 5, "IX" => 9,
								"X" => 10, "XL" => 40,  
								"L" => 50, "XC" => 90, 
								"C" => 100, "CD" => 400,
								"D" => 500, "CM" => 900,
								"M" => 1000}
@romans_arr = ["I", "V", "X", "L", "C", "D", "M"]

def convert_two_let(let)
	if !@romans_dict[let]
		a1, a2 = let.split('')
		print @romans_dict[a1] + @romans_dict[a2]
	else
		print @romans_dict[let]
	end
end

def convert_three_let(let)
	a1, a2, a3 = let.split('')
	a23 = a2 + a3
	b1 = @romans_dict[a1]
	if !@romans_dict[a23]
		print b1 + @romans_dict[a2] + @romans_dict[a3]
	else
		print b1 + @romans_dict[a23]
	end
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
	roman = ARGV[0].length
	number = ARGV[0]
	if roman == 1
		arabic = @romans_dict[number]
		print arabic
	elsif roman == 2
		convert_two_let(number)
	elsif roman == 3
		convert_three_let(number)
	elsif roman == 4
		puts "Not yet implemented"
	end
	print "\n"
end
