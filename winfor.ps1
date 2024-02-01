
clear-host
# prompt user for input
$destinationNetwork = Read-Host "Enter the destination network (e.g., 192.168.2.0): "
$subnetMask = Read-Host "Enter the subnet mask (e.g., 255.255.255.0): "
$gatewayAddress = Read-Host "Enter the gateway address (e.g., 192.168.1.1): "

# enable packet forwarding in the windows registry
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
New-ItemProperty -Path $regPath -Name IPEnableRouter -Value 1 -PropertyType DWORD -Force | Out-Null

# add a static route using netsh
netsh interface ipv4 add route $destinationNetwork mask $subnetMask $gatewayAddress

write-host "Packet forwarding enabled and static route added."
