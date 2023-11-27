# install frask 2.1.0 from pip3 
class {'python3':
  ensure => insted,
}
  
exec { 'install_flask':
  command   => '/usr/bin/pip3 install flask==2.1.0',
  onlyif    => '/usr/bin/pip3 show flask"',
}
