# == Class: postfixadmin
#
# Install and manage the Postfix Admin webmail application.
#
# === Parameters
#
# [*version*]
#   Set the version of the web application to be installed.
#
# [*checksum*]
#   Set the checksum of the web application's archive file.
#
# [*checksum_type*]
#   Set the type of checksum.
#
# [*process*]
#   Set the process user that is used to execute the application; in this case the php interpreter.
#
# [*package_dir*]
#   Set the directory where to keep the downloaded software packages.
#
# [*install_dir*]
#   Set the directory where to install the web application.
#
# [*document_root*]
#   Set the directory which should act as document root. It will be sym-linked to the current installation.
#
# [*document_root_manage*]
#   Whether to manage the `document_root` file resource or not: either `true` or `false`.
#
# [*db_dsn*]
#   Set the database data source name (DSN) to be used when connecting to the database. Setting this parameter will
#   override the other `db_*` parameters. See http://pear.php.net/manual/en/package.database.mdb2.intro-dsn.php for
#   examples.
#
#   Note: please make sure any special characters are properly encoded (e.g. use stdlib's uriescape function).
#
# [*db_type*]
#   Set the type database (e.g. mysql or pgsql). See http://pear.php.net/manual/en/package.database.mdb2.intro-dsn.php
#   for a reference of supported types. Defaults to `pgsql`.
#
# [*db_name*]
#   Set the name of the database. Defaults to `postfixadminmail`.
#
# [*db_host*]
#   Set the hostname where the database is running. Puppet can only manage databases on the local host. Defaults to
#   `localhost`.
#
# [*db_username*]
#   Set the username used to connect to the database. Defaults to `postfixadmin`.
#
# [*db_password*]
#   Set the password used to authenticate the database user. The module will encode any special characters. Defaults to
#   `pass`.
class postfixadmin (
  $package                         = $postfixadmin::params::package,
  $config_file_group               = $postfixadmin::params::config_file_group,

  $db_dsn                          = undef,
  $db_type                         = 'mysql',
  $db_name                         = 'postfix',
  $db_host                         = 'localhost',
  $db_username                     = 'postfix',
  $db_password                     = 'postfixadmin',

  $password_hash                   = 'changeme',
  $postfix_admin_url               = '',
  $admin_email                     = 'postmaster@change-this-to-your.domain.tld',
  $min_password_length             = '5',
  $generate_password               = 'NO',
  $show_password                   = 'NO',
  $default_aliases                 = {
    'abuse' => 'abuse@change-this-to-your.domain.tld',
    'hostmaster' => 'hostmaster@change-this-to-your.domain.tld',
    'postmaster' => 'postmaster@change-this-to-your.domain.tld',
    'webmaster' => 'webmaster@change-this-to-your.domain.tld'
  },
  $domain_path                     = 'NO',
  $domain_in_mailbox               = 'YES',
  $aliases                         = '10',
  $mailboxes                       = '10',
  $maxquota                        = '10',
  $domain_quota_default            = '2048',
  $quota                           = 'NO',
  $transport                       = 'NO',
  $transport_options               = [
    "'virtual',  // for virtual accounts",
    "'local',    // for system accounts",
    "'relay'     // for backup mx",
  ],
  $vacation                        = 'NO',
  $vacation_domain                 = 'autoreply.change-this-to-your.domain.tld',
  $alias_control                   = 'NO',
  $alias_control_admin             = 'NO',
  $special_alias_control           = 'NO',
  $show_footer_text                = 'YES',
) inherits postfixadmin::params {
  validate_string($package)
  validate_string($config_file_group)
  validate_string($db_type)
  validate_string($db_name)
  validate_string($db_host)
  validate_string($db_username)
  validate_string($db_password)

  class { 'postfixadmin::install': } ->
  class { 'postfixadmin::config': }
}
