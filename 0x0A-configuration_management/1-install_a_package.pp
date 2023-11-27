# install frask 2.1.0 from pip3 


class { 'python3':
  version => 'system',
}

exec { 'install_flask':
  command => '/mnt/c/Python311/Scripts/pip3 install Flask==2.1.0',
  path    => '/usr/bin/python3.8',
  unless  => '/mnt/c/Python311/Scripts/pip3 show Flask | grep -q "Version: 2.1.0"',
}
