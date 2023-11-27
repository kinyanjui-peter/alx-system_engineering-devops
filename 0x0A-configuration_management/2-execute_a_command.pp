# 2-execute_a_command.pp
#create a manifest that kills a process named killmenow
# Must use the exec Puppet resource
# Must use pkill

exec { 'killmenow':
  command => '/usr/bin/pkill killmenow',
  onlyif  => '/usr/bin/pgrep -f "killmenow"',
} 
