#create a manifest that kills a process named killmenow
# Must use the exec Puppet resource
# Must use pkill

exec { 'killing':
  command => '/usr/bin/pkill killmenow',
  onlyif  => '/usr/bin/pgrep -f "killmenow"',
} 
