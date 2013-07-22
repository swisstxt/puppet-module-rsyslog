define rsyslog::config (
  $ensure = present,
  $content = '',
  $source = '',
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
