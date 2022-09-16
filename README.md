# cloudwatch_logs_download
This bash script will help in downloading Logs from AWS cloudwatch with Unix timestamp from AWSCLI2.

# REQUIREMENTS
1 - We need a Linux machine/WSL2.

2 - AWSCLI configured with Cloudwatch Access.

# How To Use
- clone this script into into local.
- give execute permission to file with below command.
     
  `chmod 775 cloudwatch_logs_download`
- edit the script with appropriate option i.e - `log-group_name, start-time, end-time etc`
- use below commands to run the scripts.
        
   `bash cloudwatch_logs_download`
 - This will download the logs with Unix timestamp.
