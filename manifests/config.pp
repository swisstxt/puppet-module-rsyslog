define rsyslog::config (
  $content = '',
  $order = '20',
  $ensure = present,
){

  file {"/etc/rsyslog.d/${order}_${title}.conf":
    ensure  => $ensure,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => $content,
    notify  => Service['rsyslog'],
    require => Package['rsyslog'],
  }
}
