# Class: postfixadmin::install
#
# Install the Postfix Admin software package.
#
class postfixadmin::install inherits postfixadmin {
  package { $postfixadmin::package:
    ensure => installed,
  }
}
