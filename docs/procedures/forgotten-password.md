# Forgotten password

## Symptom

The user cannot log in to their Windows session or an application because they forgot their password, or the account is locked.

## Quick checks

- Is Caps Lock on? Is the keyboard layout correct (ENG or FR)?
- Does the user see "wrong password" or "account locked"? A locked account unlocks itself after 30 minutes.
- Can the user log in on another device with the same password? If yes, the problem is the device, not the password.

## Step-by-step fix

1. Verify the identity of the user before any change: call them back on a known number, or ask their manager to confirm. Never reset a password on a simple email request.
2. On the domain controller, open PowerShell as administrator.
3. Reset the password: `Set-ADAccountPassword -Identity firstname.lastname -Reset -NewPassword (Read-Host "New password" -AsSecureString)`
4. Force a change at next login: `Set-ADUser -Identity firstname.lastname -ChangePasswordAtLogon $true`
5. Unlock the account if needed: `Unlock-ADAccount -Identity firstname.lastname`
6. Give the temporary password by phone, never by email.
7. Ask the user to log in and choose a new password of at least 10 characters.
8. Record the action in the ticket.

## When to escalate

- The identity of the caller cannot be verified.
- The account keeps getting locked: possible attack or a device with an old saved password. Contact the security team.
- The user is a VIP or an administrator account.