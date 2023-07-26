# Dockerized Cron Job Execution with Supervisor

   This repository contains a Dockerfile and supporting files to set up cron jobs inside a Docker container using 
   Supervisor for processmanagement.

## Description

    This Dockerfile builds an optimized Python 3.8 environment with cron and Supervisor to schedule and manage cron
    jobs in a container.The cron directory contains multiple job_name.sh files, each defining a specific command to
    execute at scheduled times. The schedule configuration is done in the crontab file within the cron directory, 
    where you can specify the absolute path to each job_name.sh file.
    

    
    
    


Customize the cron jobs:

    Inside the cron directory, create individual job_name.sh files, each containing the command you want to execute
    at specific times.


Configure the cron schedule:

    Edit the crontab file within the cron directory, providing the schedule and absolute paths to the corresponding job_name.sh files.
    
The cron jobs will now be executed as per the schedule specified in the crontab file. The logs will be available in /var/log/cron.log.
    
Note: Do not edit the supervisord.conf file, as it is responsible for process management in the container.

