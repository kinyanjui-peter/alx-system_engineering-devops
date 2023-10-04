#!/usr/bin/env ruby
# regex

ARGV[0].scan(/^\d\d\d\d\d\d\d\d\d\d$/).each do |match|
  puts match
end
