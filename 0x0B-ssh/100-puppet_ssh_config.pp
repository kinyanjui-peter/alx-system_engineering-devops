# ssh_config.pp

# Ensure the SSH client configuration is set up
file { '/home/your_username/.ssh/config':
  ensure  => 'present',
  content => 'IdentityFile ~/.ssh/school
      	      PasswordAuthentication no',
}

