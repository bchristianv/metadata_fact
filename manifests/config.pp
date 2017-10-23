# external_fact::config
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include external_fact::config
class external_fact::config {

  File {
    owner  => '0',
    group  => '0',
    mode   => '0755',
  }

  file { '/etc/puppetlabs/facter':
    ensure => directory,
  }

  file { '/etc/puppetlabs/facter/facts.d':
    ensure => directory,
  }

}
