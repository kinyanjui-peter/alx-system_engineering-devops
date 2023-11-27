# install frask 2.1.0 from pip3 
class python3 {
  package { 'python3':
    ensure => installed,
  }
}

include python3
  
exec { 'install_flask':
  command   => '/mnt/c/Python311/Scripts/pip3 install flask==2.1.0',
  unless    => '/mnt/c/Python311/Scripts/pip3 flask | grep -q "Version: 2.1.0"',
}

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
