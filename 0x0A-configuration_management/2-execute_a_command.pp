#create a manifest that kills a process named killmenow
# Must use the exec Puppet resource
# Must use pkill

$process_name = killmenow,
exec { 'killing':
  command => '/usr/bin/pkill ${process_name}",
  unless  => '/usr/bin/pgrep -f ${process_name}}",
} 
