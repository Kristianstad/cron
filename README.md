# sam-cron
Secure and Minimal Docker base-image for cron scheduling.

## Environment variables
### pre-set runtime variables
* VAR_LINUX_USER="cron"
* VAR_FINAL_COMMAND="/usr/sbin/crond -f -d 8"

### Other runtime variables
* VAR_&lt;name&gt;: (optional) A command that, at cron-time, generates a serial.
* VAR_cmd_&lt;name&gt;: The command run by named cron job.
* VAR_cron_&lt;name&gt;: When to run named cron job.

## Cron examples
>VAR_weekdays="/bin/date +%a"  
VAR_cmd_weekdays="cp -a /data /backup/\$VAR_weekdays"  
VAR_cron_weekdays="0 21 \* \* 1-5"

>VAR_weekly="(( $(/bin/date +%d) + 6 ) / 7)"  
VAR_cmd_weekly="cp -a /data /backup/\$VAR_weekly"  
VAR_cron_weekly="0 19 \* \* 5"

>VAR_monthly="/bin/date +%b"  
VAR_cmd_monthly="cp -a /data /backup/\$VAR_monthly"  
VAR_cron_monthly="0 17 1 * *"

## Capabilities
Can drop all but SETPCAP, SETGID and SETUID.
