# minebox_monitor
#
# Installs and configures optional monitoring components for use with the minebox base module.
#
# @summary A short summary of the purpose of this class
#
# @example Declaring the class
#   include minebox_monitor
# @param docker A hash containing various options for docker
class minebox_monitor (
    Hash $docker,
){
  contain minebox_monitor::install
  contain minebox_monitor::config

  Class['minebox_monitor::install']
  -> Class['minebox_monitor::config']
}
