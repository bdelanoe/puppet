
# TP1
# Automatisation du provisionning d'un serveur de wikis





# Installation des packages nécessaires
package {
  'apache2':
    ensure => installed;
  'php7.3':
    ensure => installed;
  'wget':
    ensure => installed;
}

# Téléchargement dokuwiki
exec {
  'download-dokuwiki':
#    command => '/usr/bin/wget --no-check-certificate -O dokuwiki.tgz https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz && test $( md5sum /usr/src/dokuwiki.tgz | awk "{print $1;}" ) = "8867b6a5d71ecb5203402fe5e8fa18c9" || rm -f /usr/src/dokuwiki.tgz',
    command => '/usr/bin/wget --no-check-certificate -O dokuwiki.tgz https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz',
    creates => '/usr/src/dokuwiki.tgz',
    cwd     => '/usr/src',
    require => Package['wget']
}

file {
  '/usr/src/dokuwiki.tgz':
    require => Exec['download-dokuwiki']
}

# Dézippage de l'archive si présente
exec {
  'unzip-dokuwiki':
    command => '/bin/tar xavf dokuwiki.tgz',
    cwd     => '/usr/src',
    creates => '/usr/src/dokuwiki-2020-07-29',
    require => File['/usr/src/dokuwiki.tgz']
}

# Création lien symbolique (évite les risques liés la copie des fichiers)
file {
  '/usr/src/dokuwiki':
    ensure  => link,
    target  => '/usr/src/dokuwiki-2020-07-29',
    require => Exec['unzip-dokuwiki']
}





# Création dossiers pour les données des sites
# Avec droits pour apache
# Et synchornisation avec le dossier dokuwiki
file {
  '/var/www/recettes.wiki':
    ensure  => directory,
    owner   => 'www-data',
    group   => 'www-data',
    source  => '/usr/src/dokuwiki',
    recurse => true,
    force   => true,
    replace => true,
    links   => follow,
    require => File['/usr/src/dokuwiki'];
  '/var/www/politique.wiki':
    ensure  => directory,
    owner   => 'www-data',
    group   => 'www-data',
    source  => '/usr/src/dokuwiki',
    recurse => true,
    force   => true,
    replace => true,
    links   => follow,
    require => File['/usr/src/dokuwiki'];
}

# Création du fichier de configuration pour recettes.wiki et politique.wiki







# Activation de la configuration

# Ajout du DNS pour recettes.wiki et politique.wiki dans /etc/hosts




