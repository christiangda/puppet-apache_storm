# Class: apache_storm::params
# ===========================
class apache_storm::params {

  $ensure    = 'present'
  $version   = '1.0.3'
  $user      = 'storm'
  $group     = 'storm'
  $repo_base = 'http://apache.claz.org/storm'

  $package_name  = 'apache-storm'
  $install_path  = "/opt/${package_name}"
  $config_path   = "/etc/${package_name}"
  $logs_path     = "/var/log/${package_name}"
  $pid_path      = "/var/run/${package_name}"
  $releases_path = "${install_path}/releases"
  $sources_path  = "${install_path}/sources"
  $current_path  = "${install_path}/current"

  ##############################################################################
  # Config Hashes
  $default_common_config = {
    'nimbus.seeds'                          => ['localhost'],
    'storm.zookeeper.servers'               => ['localhost'],
    'storm.local.dir'                       => "${install_path}/storm_local_dir",
    'storm.health.check.dir'                => 'healthchecks',
    'java.library.path'                     => '/usr/local/lib:/opt/local/lib:/usr/lib',
    'storm.cluster.mode'                    => 'distributed',

    'nimbus.childopts'                      => '-Xmx256m -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8',
    'ui.childopts'                          => '-Xmx768m -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8',

    'supervisor.slots.ports'                => [6700, 6701, 6702, 6703],
    'supervisor.childopts'                  => '-Xmx768m -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8',
    'drpc.childopts'                        => '-Xmx768m -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8',
    'logviewer.childopts'                   => '-Xmx256m -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8',
  }
}
