# external_fact
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include external_fact
class external_fact ($site_id = undef) {

  include external_fact::config

  if $site_id {
    external_fact::fact { 'site_id':
      external_fact_value => $site_id,
    }
  }

}
