# install frask 2.1.0 from pip3 


class { 'python':
  version => 'system',
  ensure  => installed,
}

exec { 'install_flask':
  command => '/mnt/c/Python311/Scripts/pip3 install Flask==2.1.0',
  onlyif  => '/mnt/c/Python311/Scripts/pip3 show Flask | grep -q "Version: 2.1.0"',
}
