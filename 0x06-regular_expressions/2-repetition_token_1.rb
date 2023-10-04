#!/usr/bin/env ruby
# regular expression that will match htn and hbtn

ARGV[0].scan(/hb?tn/).each do |match|
  puts match
end
