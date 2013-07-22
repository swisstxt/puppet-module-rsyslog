define rsyslog::config (
  $content = '',
  $ensure = present,
  $order = '20',
){

  file {"/etc/rsyslog.d/${rsyslog::order}_${::dname}.conf":
    ensure  => $ensure,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => $content,
    notify  => Service['rsyslog'],
    require => Package['rsyslog'],
  }
}
