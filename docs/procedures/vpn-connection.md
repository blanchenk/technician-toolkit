# VPN will not connect

## Symptom

A remote user cannot connect to the company VPN. The client shows "authentication failed" or "connection timed out".

## Quick checks

- Does the user have Internet at home? Test a public website first.
- Is the user typing the right login and password (Caps Lock, keyboard layout)?
- Is the date and time of the PC correct? A wrong clock breaks authentication.

## Step-by-step fix

1. Ask the user for the exact error message and the time of the attempt.
2. Check the account in Active Directory: `Get-ADUser -Identity firstname.lastname -Properties Enabled, LockedOut`. The account must be enabled and not locked.
3. If the account is locked, run `Unlock-ADAccount -Identity firstname.lastname`. If the password is the problem, follow the "Forgotten password" procedure.
4. Check that the user is in the group allowed to use the VPN.
5. Ask the user to restart the VPN client, then the PC.
6. Test from another network (for example a phone hotspot): if it works, the home network or router blocks the VPN.
7. Reinstall the VPN client if the error stays the same.
8. Record the steps in the ticket and keep the user informed, especially if they have a meeting.

## When to escalate

- Several users fail at the same time: the VPN server or the firewall may be down, contact the network team immediately.
- The account is fine and the client is new, but the error stays: escalate to the VPN administrator.