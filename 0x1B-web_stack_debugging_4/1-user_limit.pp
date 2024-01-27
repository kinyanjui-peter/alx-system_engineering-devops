# enable user holbetrton to login without error
# increase hard-files-for-holbetrton
exec { 'increase_hard_file_for_user_holberton':
    command => "sed -i '/^holbetrton hard/s/5/5000/' /etc/security/limits.conf",
    path => '/usr/local/bin/:/bin/',
}
exec {'increse-soft-filr-for-holbetrton':
command => 'sed -i "holbetrton soft/s/4/5000" /etc/security/limits.conf',
path => '/usr/local/bin/:/bin/'
}