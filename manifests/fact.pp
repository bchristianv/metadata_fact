# external_fact::fact
#
# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   external_fact::fact { 'namevar': }
define external_fact::fact(
  Any $external_fact_value,
  String $external_fact_key  = $title,
  # String $external_fact_value = lookup("external_fact::${title}", 'None')
) {

  if ! defined(Class['external_fact']) {
    fail("You must include the 'external_fact' base class before using any of it's defined resources.")
  }

  if $external_fact::site_id {
    $external_fact_name = "${external_fact::site_id}_${external_fact_key}"
  }
  else {
    $external_fact_name = $external_fact_key
  }

  file { "/etc/puppetlabs/facter/facts.d/${external_fact_name}.json":
    ensure  => file,
    content => template('external_fact/external_fact.json.erb'),
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }

}
