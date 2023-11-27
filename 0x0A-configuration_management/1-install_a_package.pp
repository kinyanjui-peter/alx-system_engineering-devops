# install frask 2.1.0 from pip3 
class {'python3':
  ensure => insted,
}
  
exec { 'install_flask':
  command   => 'install flask==2.1.0',
  path      => '/usr/bin/pip3',
  onlyif    => '/usr/bin/pip3 show flask',
}
