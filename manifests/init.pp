# Class: apache_storm
# ===========================
class apache_storm (
  $ensure    = $apache_storm::params::ensure,
  $version   = $apache_storm::params::version,
  $user      = $apache_storm::params::user,
  $group     = $apache_storm::params::group,
  $repo_base = $apache_storm::params::repo_base,
  $config    = {},
  ) inherits apache_storm::params {

  # check valid values for package ensure param
  if ! ($ensure in [ 'present', 'installed', 'absent' ]) {
    fail('Invalid ensure value.  Allowed values are: present, installed, absent')
  }
  # Fail fast if we're not using a new Puppet version.
  # PROBLEM: https://tickets.puppetlabs.com/si/jira.issueviews:issue-html/PUP-5683/PUP-5683.html
  # if versioncmp($::puppetversion, '3.8.0') < 0 {
  #   fail("This module requires the use of Puppet v3.8.0 or newer, and you are using version: ${::puppetversion}")
  # }

  # Fail fast if we're not using a new apache storm version
  if versioncmp($version, '0.10.0') < 0 {
    fail('This module work only with Apache Storm version >= 1.0.0')
  }

  $package_release   = "${apache_storm::params::package_name}-${version}"
  $package_file      = "${package_release}.tar.gz"
  $package_uri       = "${repo_base}/${package_release}/${package_file}"
  $package_file_path = "${apache_storm::params::sources_path}/${package_file}"
  $releases_home     = "${apache_storm::params::releases_path}/${package_release}"

  $package_bin_path  = "${releases_home}/bin"
  $package_conf_path = "${releases_home}/conf"
  $package_logs_path = "${releases_home}/logs"

  $storm_command = "${package_bin_path}/storm"

  validate_hash($config)

  # merge configs
  $config_options = merge($apache_storm::params::default_common_config, $config)
  validate_hash($config_options)

  include ::apache_storm::install
  include ::apache_storm::config
  Class['apache_storm::install'] -> Class['apache_storm::config']
}
