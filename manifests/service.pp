# Class: postfixadmin::service
#
# Service management related configuration.
#
# It is a PHP-based web application. Normally, no service needs to be notified. Every change should happen instantly.
# Hence, the final step of the installation is to update the symbolic link referencing the current version.
#
# === Copyright
#
# Copyright 2015 Martin Meinhold, unless otherwise noted.
#
class postfixadmin::service inherits postfixadmin {

  if str2bool($postfixadmin::document_root_manage) {
    file { $postfixadmin::document_root:
      ensure => link,
      target => $postfixadmin::install::target,
      owner  => 'root',
      group  => 'root',
    }
  }
}
