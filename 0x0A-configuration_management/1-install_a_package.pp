# install frask 2.1.0 from pip3 


class { 'python':
  version => 'system',
  ensure  => installed,
}

exec { 'install_flask':
  command   => '2.1.0',
   provider => 'pip3',
}
