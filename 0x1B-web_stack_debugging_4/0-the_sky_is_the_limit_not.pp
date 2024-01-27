# This manifest improves the amount of traffic on the Nginx server
# This is done by increasing the ULIMIT beyond the set level

# Exec resource to adjust ULIMIT in the Nginx configuration file
exec { 'fix_for_nginx_ulimit':
  command => '/bin/sed -i "s/15/4000/" /etc/default/nginx',
  
  # Replace the value '15' with '4000' in the nginx configuration file
  path    => ['/usr/local/bin/', '/bin/'],
  
  # Set the PATH environment variable for the command execution
  notify  => Exec['nginx_restart'],
  # Notify the 'nginx_restart' exec resource to restart Nginx after
  # updating ULIMIT
}

# Exec resource to restart Nginx after updating ULIMIT
exec { 'nginx_restart':
  command     => '/etc/init.d/nginx restart',
  # Restart Nginx service
  path        => ['/etc/init.d/'],
  # Set the PATH environment variable for the command execution
  refreshonly => true,
  # Ensure the exec resource is only triggered when the ULIMIT is updated
}
