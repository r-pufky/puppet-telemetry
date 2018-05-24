class telemetry {
  if $::telemetry {
    service { 'DiagTrack':
      ensure => stopped,
      enable => false,
    }
  }
}
