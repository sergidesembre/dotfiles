# cron

This path is related with all automatic task using linux crontab

## How does it work?
I have ``crontask`` folder with shell script files to execute when execute the crontab jobs.

Next is ``crontab.cron`` file where define all crontab jobs to execute. To make for easy to understand I commented each job the period time to execute.

If I execute the ``install.sh`` that's add the job tasks from ``crontab.cron`` file into system crontab. After this, to check was added correctly show me current crontab jobs are into the system.

## How to add new crontab task?
- Create new shell script task in ``crontab`` folder (ensure the script are run correctly).
- Add new crontab job with the new script file to execute into ``crontab.cron`` file with a specific period time to execute.

```text
Remember: If I need update the period time to execute crontab job I can change in "crontab.cron" file and execute "install.sh" file to update crontab from the system.
```

## To improve
- ...