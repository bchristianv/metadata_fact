define metadata_fact::fact (
  $metadata_key   = $title,
  $metadata_value = hiera("metadata_fact::${title}", 'None'),
  $metadata_type  = 'json',
){
  if ! defined(Class['metadata_fact']) {
    fail("You must include the 'metadata_fact' base class before using any of it's defined resources.")
  }

  if $metadata_fact::site_id {
    $metadata_name = "${metadata_fact::site_id}_${metadata_key}"
  }
  else {
    $metadata_name = $metadata_key
  }

  $metadata_template = $metadata_type ? {
    'json'  => 'metadata_fact.json.erb',
    'txt'   => 'metadata_fact.txt.erb',
    'yaml'  => 'metadata_fact.yaml.erb',
    default => 'metadata_fact.json.erb',
  }

  file { "/etc/puppetlabs/facter/facts.d/${metadata_name}.${metadata_type}":
    ensure  => file,
    content => template("metadata_fact/${metadata_template}"),
    group   => '0',
    mode    => '0644',
    owner   => '0',
  }
}
