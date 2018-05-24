# Detect windows telemetry services

powershell = 'C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe'
command = "if (Get-Service '%s' -ErrorAction SilentlyContinue) { Write-Host 'true' }"

Facter.add(:telemetry) do
  confine :kernel => :windows
  setcode do
    service = command % 'DiagTrack'
    Facter::Util::Resolution.exec(%Q{#{powershell} -command "#{service}"}).to_s == "true"
  end
end
