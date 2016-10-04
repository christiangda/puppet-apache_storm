# Class: apache_storm
# ===========================
class apache_storm (
  $ensure    = $::apache_storm::params::ensure,
  $version   = $::apache_storm::params::version,
  $user      = $::apache_storm::params::user,
  $group     = $::apache_storm::params::group,
  $repo_base = $::apache_storm::params::repo_base,
  $config    = {},
  ) inherits apache_storm::params {

  # check valid values for package ensure param
  if ! ($ensure in [ 'present', 'installed', 'absent', 'purged', 'held', 'latest' ]) {
    fail('ensure is not a valid status parameter value')
  }
  # Fail fast if we're not using a new Puppet version.
  if versioncmp($::puppetversion, '3.7.0') < 0 {
    fail('This module requires the use of Puppet v3.8.0 or newer.')
  }
  # Fail fast if we're not using a new apache storm version
  if versioncmp($version, '0.10.0') < 0 {
    fail('This module work only with Apache Storm version >= 1.0.0')
  }

  validate_hash($config)

  # merge configs
  $config_options = merge($::apache_storm::params::default_common_config, $config)
  validate_hash($config_options)

  class { 'apache_storm::install': } ->
  class { 'apache_storm::config': }
}
