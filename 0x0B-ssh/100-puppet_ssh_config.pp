include stdlib
line_config {'adjusting the configuration file':
  ensure	=> 'present',
  path		=> '~/.ssh/school',
  line 		=> 'PasswordAuthentication no',
  replace 	=> true
}
