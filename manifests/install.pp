# Class: postfixadmin::install
#
# Install the Postfix Admin software package.
#
class postfixadmin::install inherits postfixadmin {

  $archive = "postfixadmin-${postfixadmin::version}"
  $target = "${postfixadmin::install_dir}/postfixadmin-${postfixadmin::version}"
  # $download_url = "http://downloads.sourceforge.net/project/postfixadmin/postfixadmin/${archive}/${archive}.tar.gz"
  $download_url = "http://ufpr.dl.sourceforge.net/project/postfixadmin/postfixadmin/${archive}/${archive}.tar.gz"
  notify {"THOMAS: $download_url": }

  ensure_resource('file', [
    $postfixadmin::install_dir,
    $postfixadmin::package_dir,
  ], { 'ensure' => 'directory' })

  archive { $archive:
    ensure           => present,
    digest_string    => $postfixadmin::checksum,
    digest_type      => $postfixadmin::checksum_type,
    url              => $download_url,
    follow_redirects => true,
    target           => $postfixadmin::install_dir,
    src_target       => $postfixadmin::package_dir,
    root_dir         => "postfixadmin-${postfixadmin::version}",
    timeout          => 600,
    require          => [
      File[$postfixadmin::install_dir],
      File[$postfixadmin::package_dir]
    ],
  }

}
