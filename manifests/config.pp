class metadata_fact::config {

  #Setup directories
  File {
    group  => '0',
    mode   => '0755',
    owner  => '0',
  }

  file { '/etc/puppetlabs/facter':
    ensure => directory,
  }

  file { '/etc/puppetlabs/facter/facts.d':
    ensure => directory,
  }
}
