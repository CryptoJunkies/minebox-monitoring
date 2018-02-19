# minebox_monitor::docker::container::cadvisor
#
# Creates Docker container for cadvisor
#
# @summary Creates Docker container for cadvisor, used for host and container monitoring.
#
# @example
#   include minebox_monitor::docker::container::cadvisor
#
# @param service_name Name to use for the container
# @param image_name Name of the container image to deploy
# @param storage_driver_password Password for sending data to InfluxDB
# @param storage_driver_user User for sending data to InfluxDB
# @param storage_driver_host Hostname or IP of the InfluxDB server
# @param port_publish The port to publish on the host
#
class minebox_monitor::docker::container::cadvisor (
  String $service_name,
  String $image_name,
  String $storage_driver_password,
  String $storage_driver_user,
  String $storage_driver_host,
  String $port_publish,
){

  docker::run { $service_name :
    image    => $image_name,
    hostname => $::hostname,
    volumes  => [
      '/etc/localtime:/etc/localtime:ro',
      '/var/lib/docker/:/var/lib/docker:ro',
      '/dev/disk/:/dev/disk:ro',
      '/sys:/sys:ro',
      '/:/rootfs:ro',
      '/var/run:/var/run',
    ],
    ports    => [
      "${port_publish}:8080/tcp",
    ],
    command  => "-storage_driver=influxdb -storage_driver_db=cadvisor_db -storage_driver_user=${storage_driver_user} -storage_driver_password=${storage_driver_password} -storage_driver_host=${storage_driver_host}",
  }

}
