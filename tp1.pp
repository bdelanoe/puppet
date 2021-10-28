
# TP1

package {
  'apache2':
    ensure => installed;
  'php7.3':
    ensure => installed;
}

exec {
  'get-dokuwiki':
    command => "wget -O /usr/src/dokuwiki.tgz https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz",
    path => ['/usr/bin', '/usr/sbin'];

  'unzip-dokuwiki-1':
    command => "/usr/bin/bash -c 'cd /usr/src'";
  'unzip-dokuwiki-2':
    command => "/usr/bin/tar xavf dokuwiki.tgz",
    cwd => "/usr/src",
    require => Exec['unzip-dokuwiki-1'];
  'unzip-dokuwiki-3':
    command => "/usr/bin/mv dokuwiki-2020-07-29 dokuwiki",
    cwd => "/usr/src",
    require => Exec['unzip-dokuwiki-2'];
}


