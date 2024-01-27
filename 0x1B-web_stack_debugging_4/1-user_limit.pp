# enable user holbetrton to login without error
# increase hard files for holbetrton
exec { 'increase_hard_file_for_user_holberton':
    command => "sed -i '/^holberton hard/s/5/5000/' /etc/security/limits.conf",
    path    => '/usr/local/bin/:/bin/',
}

# increase soft files for holbetrton
exec { 'increase_soft_file_for_holberton':
    command => 'sed -i "/^holberton soft/s/4/5000/" /etc/security/limits.conf',
    path    => '/usr/local/bin/:/bin/',
}