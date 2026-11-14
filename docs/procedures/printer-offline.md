# Printer offline

## Symptom

A shared printer appears as "Offline" and nobody can print, or print jobs stay in the queue.

## Quick checks

- Is the printer powered on, with no error light or paper jam?
- Is the network cable plugged in, or is the printer connected to the Wi-Fi?
- Can other users print, or only one person? One person means a local problem, everyone means the printer or the print server.

## Step-by-step fix

1. Find the IP address of the printer (printed configuration page or the printer screen).
2. Test the network from the user's PC: `ping 192.168.1.50` (use the real IP). No reply means a network or power problem.
3. If the printer replies, restart the print service on the PC: open PowerShell as administrator and run `Restart-Service Spooler`.
4. Clear a blocked queue: `Stop-Service Spooler`, delete the files in `C:\Windows\System32\spool\PRINTERS`, then `Start-Service Spooler`.
5. In Settings, Printers and scanners, remove the printer and add it again.
6. Print a test page and ask the user to confirm.
7. Record the cause and the fix in the ticket.

## When to escalate

- The printer does not answer to ping after a power cycle: send a technician on site to check the cable and the printer.
- Several printers are offline at once: check the print server or the network switch.