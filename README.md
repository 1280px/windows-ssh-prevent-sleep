# windows-ssh-prevent-sleep

A tiny but very handful PowerShell script to prevent Windows from sleep when connecting through SSH (because for some reason it doesn't do it automatically). It also logs how many connections at the moment there are, in case you're paranoid about someone else getting access while you're AFK. I usually don't upload such small scripts but I thought it might be useful for someone else.

Based on this script: https://superuser.com/questions/1753647/how-to-turn-off-sleep-during-active-ssh-connections-in-windows (uses disconnect event to check, which works a bit scuffed, i.e. if a remote lost connection it would still think it is connected)

## Installation

If you want for it to run all the time:
1. Download the script
2. In task scheduler, create an event that runs on PC startup, and add this to action:<br>
`cmd.exe /c start powershell.exe -NoExit -ExecutionPolicy Bypass -File (path to script)`<br>
(this way it will run in a cmd/wt window and display connection logs on screen)
3. Click "Run" in sidebar to start it first time without rebooting

Also can also simply run it though PS session after you connected from remote, so you can stop it when disconnecting.
