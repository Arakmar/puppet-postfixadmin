# Class: postfixadmin::config
#
# Manage the Postfix Admin configuration files.
#

class postfixadmin::config inherits postfixadmin {

  file { $postfixadmin::params::config_dir:
    ensure => 'directory',
    purge => true,
    recurse => true,
    force => true,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }

  file { "${postfixadmin::params::config_dir}/config.inc.php":
    ensure  => present,
    content => template('postfixadmin/config.inc.php.erb'),
    mode => '0640',
    owner => root,
    group => $postfixadmin::config_file_group,
  }
}
