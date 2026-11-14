# No Internet access

## Symptom

The user cannot open websites or online tools. The network icon shows a warning.

## Quick checks

- Is the user on Wi-Fi or cable? Is the cable plugged in, and is Wi-Fi enabled (no airplane mode)?
- Do other colleagues have the same problem? If yes, the problem is the network, not the PC.
- Does an internal site or shared folder still work? If yes, the local network is fine and the problem is the Internet link or DNS.

## Step-by-step fix

1. Check the IP configuration: `ipconfig`. An address starting with `169.254` means the PC did not get an address from the DHCP server.
2. Ping the gateway (the router address shown by `ipconfig`): `ping 192.168.1.254`. No reply means the local network is down.
3. Ping a public IP: `ping 8.8.8.8`. A reply means the connection to the Internet works.
4. Ping a name: `ping google.com`. If the IP works but the name fails, the problem is DNS.
5. Clear the DNS cache: `ipconfig /flushdns`.
6. Renew the address: `ipconfig /release`, then `ipconfig /renew`.
7. Restart the PC, then test again.
8. Record the results of each ping in the ticket.

## When to escalate

- Several users are affected: contact the network team or the Internet provider.
- The gateway does not answer: check the router and the switch.