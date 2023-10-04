#!/usr/bin/env ruby
# regex

ARGV[0].scan(/hbt?{1,}n/).each do |match|
  puts match
end

