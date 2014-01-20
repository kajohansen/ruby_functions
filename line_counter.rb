#!/usr/bin/env ruby
#
# project line counter

APP_ROOT = File.dirname(__FILE__) 
require APP_ROOT + '/StringExtensions.rb'

@file_hash = Hash.new
@dir_arr = []
@blanks = 0
@dir_total = 0
@project_total = 0

def set_directory(dir, name)
  Dir.chdir(dir)
  @file_hash[name] = Array.new
  Dir.foreach("./") { 
    |file| 
    if !"#{file}".match(/^\.+/)
      if File.directory?("#{file}")
        if file != "libraries" && file != "images" && file != "log"
          @newdir = Dir.getwd.to_s + '/' + "#{file}"
          @dir_arr.push(@newdir)
        end
      else
        @file_hash[name].push("#{file}")
      end
    end
  }
end

def count_file_row_length(file)
  count = 0
  file.each do |line|
    if line.strip.chomp != ""
      count = count + 1
    else
      @blanks = @blanks + 1
    end
  end
  @dir_total = @dir_total + count
  return count.to_s
end

if ARGV.length == 1
  root_dir = ARGV[0]
  puts "Setting root directory: #{root_dir}"
  set_directory(root_dir, "root")
  puts " ------ Directory Root ------ ".bold.bg_gray
  @file_hash["root"].each do |file|
    puts " " + file.to_s + ": " + count_file_row_length(File.open(file, 'r')) + " lines, " + @blanks.to_s + " blanks"
    @blanks = 0
  end
  puts "+Dir total: " + @dir_total.to_s 
  @project_total = @project_total + @dir_total
  @dir_total = 0
    
  @dir_arr.each do |dir|  
    set_directory(dir, dir)
    directory = dir.match(/\/[a-zA-Z]+$/)
    puts " ------ Directory ".bold.bg_gray + directory.to_s.bold.bg_gray + " ------ ".bold.bg_gray
    @file_hash[dir].each do |file|
      puts " " + file.to_s + ": " + count_file_row_length(File.open(file, 'r')) + " lines, " + @blanks.to_s + " blanks"
      @blanks = 0
    end
    puts "+Dir total: " + @dir_total.to_s 
    @project_total = @project_total + @dir_total
    @dir_total = 0
  end
  puts "\n\t++++ Project Total lines: ".bold.blue + @project_total.to_s.bold.magenta + " ++++\n\n".bold.blue
else
  puts "You have to enter the path of the project"
end
