#!/usr/bin/env ruby
# regular expression that will match Holberton

ARGV[0].scan(/hbt{2,5}n/).each do |match|
  puts match
end
