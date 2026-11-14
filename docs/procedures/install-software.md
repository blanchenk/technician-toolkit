# Install software

## Symptom

A user asks for a program they do not have, for example a file compression tool.

## Quick checks

- Is the software on the company list of approved software?
- Is a licence needed, and is one available?
- Who asks for it, and does the manager agree when it costs money?

## Step-by-step fix

1. Create a ticket of type Request with the software name, the user and the reason.
2. Check that the software is approved and free of security warnings (official website only).
3. Install it on the user's PC with an administrator account. Example with the Windows package manager: `winget install 7zip.7zip`.
4. Check that the program starts and that the user can do the task they needed (for example open a compressed file).
5. Document the version installed in the ticket.
6. Close the ticket after the user confirms.

## When to escalate

- The software is not on the approved list: ask the security team and the manager for an approval.
- The software needs a paid licence: send the request to the person who manages the budget.