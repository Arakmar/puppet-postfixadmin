# == Class: postfixadmin::params
#
# Default configuration values for the `postfixadmin` class.
#
class postfixadmin::params {
  $version = '2.3.7'
  $checksum = '761074e711ab618deda425dc013133b9d5968e0859bb883f10164061fd87006e'
  $checksum_type = 'sha256'

  $package_dir = '/var/cache/puppet/archives'
  $install_dir = '/opt'

  $document_root_manage = true
  $document_root = '/var/www/postfixadmin'
  $process = 'httpd'

  $exec_paths = ['/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin']
}
