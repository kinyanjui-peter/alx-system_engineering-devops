# Using Puppet, create a file in /tmp.
# Requirements:
# File path is /tmp/school
# File permission is 0744
# File owner is www-data
# File group is www-data
# File contains I love Puppet

file { '/tmp/school':
  ensure  => 'file',
  mode    => '0744',
  group   => 'www-data',
  owner   => 'www-data',
  content => 'I love Puppet',
}
