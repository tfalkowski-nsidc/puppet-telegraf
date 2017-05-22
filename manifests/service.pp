# == Class: telegraf::service
#
# Optionally manage the Telegraf service.
#
lass telegraf::service {

  assert_private()

  if $::telegraf::manage_service {
    if ($::osfamily == 'RedHat' and $::operatingsystemmajrelease == '7') or ($::operatingsystem == 'Ubuntu' and $::operatingsystemmajrelease >= '15.10') {
      service { 'telegraf':
        ensure    => $telegraf::service_ensure,
        provider  => systemd,
        hasstatus => $telegraf::service_hasstatus,
        enable    => $telegraf::service_enable,
        restart   => $telegraf::service_restart,
        require   => Class['::telegraf::config'],
      }
    }else {
      service { 'telegraf':
        ensure    => $telegraf::service_ensure,
        hasstatus => $telegraf::service_hasstatus,
        enable    => $telegraf::service_enable,
        restart   => $telegraf::service_restart,
        require   => Class['::telegraf::config'],
      }
    }  
  }
}
