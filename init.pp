
#
# Exo 1: installer le package w3m
# * déclarer la ressource en respectant le format de Puppet (google: puppet package)
# * appliquer cette configuration avec 'puppet apply init.pp'

package { 'w3m':
  ensure => installed,
  name   => 'w3m'
}

#
# Exo 2: 
# * créer un premier fichier /tmp/demo contenant "hello world"
# * créer un second fichier /tmp/demo2 contenant "hello world 2"
# 

file {
  'hello world':
    ensure  => present,
    path    => '/tmp/demo',
    content => "hello world\n";
  'hello world 2':
    ensure  => present,
    path    => '/tmp/demo2',
    content => "hello world 2\n";
}



