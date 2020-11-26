# Do a scan on the local network for devices

function __localscan() {
  # Get IP: https://stackoverflow.com/a/21336679
  my_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')

  # replace the last .x with .0/24
  # https://unix.stackexchange.com/a/329085
  scan_ip=$(awk -F"." '{print $1"."$2"."$3".0/24"}'<<<$my_ip)

  echo "Scanning $scan_ip..."

  # Run the scan
  sudo nmap -sn $scan_ip
}

alias portscan='__localscan'
alias localscan='__localscan'
