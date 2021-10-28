
#
# Exo 1: installer le package w3m
# * déclarer la ressource en respectant le format de Puppet (google: puppet package)
# * appliquer cette configuration avec 'puppet apply init.pp'

package { 'w3m':
  ensure => installed,
  name => 'w3m'
}

#
# Exo 2: 
# * créer un premier fichier /tmp/demo contenant "hello world"
# * créer un second fichier /tmp/demo2 contenant "hello world 2"
# 

file {
  'hello world':
    path => '/tmp/demo',
    content => "hello world\n",
    ensure => present;
  
  'hello world 2':
    path => '/tmp/demo2',
    content => "hello world 2\n",
    ensure => present;
}



