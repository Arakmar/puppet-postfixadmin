# Class: postfixadmin::config
#
# Manage the Postfix Admin configuration files.
#

class postfixadmin::config inherits postfixadmin {

  $application_dir = $postfixadmin::install::target
  $config_file = "${application_dir}/config.inc.php"

  file { $config_file:
    ensure  => present,
    content => template('postfixadmin/config.inc.php.erb')
  }
}
