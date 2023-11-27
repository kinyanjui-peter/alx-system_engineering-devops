# install frask 2.1.0 from pip3 
class { 'python3':
  version => 'system',
}

package { 'python3-pip':
  ensure  => installed,
}
  
exec { 'install_flask':
  command   => '/usr/bin/pip3 install flask==2.1.0',
  unless    => '/usr/bin/pip3 flask | grep -q "Version: 2.1.0"',
  require   => package['python3-pip'],
}
