# Blue screen (BSOD)

## Symptom

Windows stops with a blue screen showing a sad face and a stop code, then restarts.

## Quick checks

- Write down the stop code (for example `CRITICAL_PROCESS_DIED`) or take a photo of the screen.
- Did the problem start after an update, a new driver, a new device or a new program?
- Does it happen once, or again and again?

## Step-by-step fix

1. Let the PC restart. If it starts normally, save the user's work first.
2. Unplug new external devices (USB drives, docks) and test again.
3. Check Windows updates and drivers: install pending updates.
4. Repair system files: open PowerShell as administrator and run `sfc /scannow`, then `DISM /Online /Cleanup-Image /RestoreHealth`.
5. Test the memory: run "Windows Memory Diagnostic" from the Start menu and restart.
6. If the PC cannot start, restart three times to open the recovery menu, then choose Safe mode or Uninstall recent updates.
7. Keep the crash files from `C:\Windows\Minidump` and attach the stop code to the ticket.

## When to escalate

- The blue screen happens several times a day: suspect a hardware problem (memory, disk) and escalate.
- The PC cannot start even in Safe mode: prepare a replacement PC and recover the data.