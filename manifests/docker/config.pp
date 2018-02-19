# minebox_monitor::docker::config
#
# Configures Docker containers, services and stacks.
#
# @summary Manages the individual Docker components for monitoring a minebox system.
#
# @example
#   include minebox_monitor::docker::config
class minebox_monitor::docker::config {
  include minebox_monitor::docker::container::cadvisor
}
