# Slow computer

## Symptom

The computer takes a long time to start or to open programs, and applications freeze.

## Quick checks

- When did the problem start? After an update, a new program, or for a long time?
- How long since the last restart? A PC that has been on for weeks needs a restart.
- Is the problem in one program (for example the browser) or everywhere?

## Step-by-step fix

1. Restart the PC if it has not been restarted for several days.
2. Open the Task Manager (`Ctrl+Shift+Esc`) and sort by CPU, Memory and Disk. Note any program using most of the resources.
3. Check the free disk space (File Explorer, This PC). Less than 10 % free slows Windows down.
4. Run the diagnostic script of this toolkit (`scripts/windows/diagnostic.ps1`) and attach the report to the ticket.
5. Disable useless startup programs: Task Manager, Startup apps tab.
6. Install pending Windows updates and restart.
7. Repair system files: open PowerShell as administrator and run `sfc /scannow`.
8. Ask the user to confirm that the speed is back to normal.

## When to escalate

- The disk usage stays at 100 % with no obvious program: the disk may be failing, escalate to hardware support.
- The memory is always full: the PC may need more RAM.
- The problem comes back after a reinstall: replace the PC.