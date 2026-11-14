# Wi-Fi will not connect

## Symptom

The computer does not see the Wi-Fi network, or it fails to connect, or it connects without Internet.

## Quick checks

- Is Wi-Fi enabled, with airplane mode off?
- Do other devices connect to the same network? If not, the problem is the access point.
- Is the user close enough to the access point?

## Step-by-step fix

1. Turn Wi-Fi off and on again from the quick settings.
2. Check the connection status: `netsh wlan show interfaces`.
3. Forget the network (Settings, Network and Internet, Wi-Fi, Manage known networks), then connect again with the password.
4. Restart the Wi-Fi adapter: Device Manager, Network adapters, right-click the Wi-Fi adapter, Disable then Enable.
5. Reset the network stack: open PowerShell as administrator and run `netsh winsock reset` and `ipconfig /flushdns`, then restart the PC.
6. Update the Wi-Fi driver from the manufacturer website if the problem continues.
7. Confirm with the user and record the cause in the ticket.

## When to escalate

- Nobody can connect to this network: check the access point and the controller.
- The Wi-Fi adapter is missing in Device Manager: hardware problem.