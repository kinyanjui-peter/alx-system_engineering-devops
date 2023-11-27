#!/usr/bin/env puppet apply
# 2-execute_a_command.pp
#create a manifest that kills a process named killmenow
# Must use the exec Puppet resource
# Must use pkill

exec { 'killng':
  command => 'pkill -f killmenow',
  onlyif  => 'pgrep -f killmenow',
} 
