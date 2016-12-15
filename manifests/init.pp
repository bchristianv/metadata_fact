# Class: metadata_fact
# ===========================
#
# Full description of class metadata_fact here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'metadata_fact':
#      site_id => 'my-site',
#    }
#
# Authors
# -------
#
# Christian Vale <bchristianv@icloud.com>
#
# Copyright
# ---------
#
# Copyright 2016 Christian Vale, unless otherwise noted.
#
class metadata_fact ($site_id = undef) {

  include metadata_fact::config

  if $site_id {
    metadata_fact::fact { 'site_id':
      metadata_value => $site_id,
    }
  }
}
