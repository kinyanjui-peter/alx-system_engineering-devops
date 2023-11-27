# install frask 2.1.0 from pip3 
class {'python3':
  path   => 'usr/bin/python3.8',
  ensure => installed,
  
exec { 'install_flask':
  command   =>  '/usr/bin/python3.8 -m pip install flask==2.1.0',
  unless    => '/usr/bin/python3.8 -m pip show Flask | grep -q "Version: 2.1.0"',
}
