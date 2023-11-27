# install frask 2.1.0 from pip3 
class {'python3':
  ensure => installed,
}
  
exec { 'install_flask':
  command   => '/usr/bin/pip3 install flask==2.1.0',
  unless    => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"',
}
