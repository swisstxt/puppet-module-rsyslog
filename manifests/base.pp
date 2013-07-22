class rsyslog::base {

  package {'rsyslog':
    ensure => installed,
  }

  file {'/etc/rsyslog.conf':
    mode    => '0644',
    content => template('rsyslog.conf.erb'),
    notify  => Service['rsyslog'],
    require => Package['rsyslog'],
  }

  service{'rsyslog':
    ensure    => running,
    enable    => true,
    hasstatus => true,
  }
}
