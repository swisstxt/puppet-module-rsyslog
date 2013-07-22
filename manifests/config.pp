define rsyslog::config (
  $content = '',
  $order = '20',
  $ensure = present,
){

  file {"/etc/rsyslog.d/${rsyslog::config::order}_${rsyslog::config::title}.conf":
    ensure  => $ensure,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => $content,
    notify  => Service['rsyslog'],
    require => Package['rsyslog'],
  }
}
