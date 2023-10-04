#!/usr/bin/env ruby
# regex

ARGV[0].scan(/^{A-Z}$/).each do |match|
  puts match
end
