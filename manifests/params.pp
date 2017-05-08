# == Class: postfixadmin::params
#
# Default configuration values for the `postfixadmin` class.
#
class postfixadmin::params {
  $package = 'postfixadmin'
  $config_dir = '/etc/postfixadmin'
  $config_file_group = 'www-data'
}
