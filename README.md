# Bash Script for looping over a file directory of exported pipeline JSON and executing a PUT command to CDF for each file

| Variable       | Use
|-----------     |-------------------------------------------------------------------
| AUTH_TOKEN     | Auth token from GCP. The command gcloud auth login will open a browers for you to login with
| LOCATION       | Location of the CDF instance. You can get this from the login page information after going to CDF in cloud console
| INSTANCE_ID    | Instance Id of the CDF instance. You can get this from the login page information after going to CDF in cloud console
| CDAP_ENDPOINT  | API Endpoint of CDF. No action needed here.

# How to Execute

In a shell navigate to the directory that contains your pipeline JSON files, and execute the .sh file while you are in that directory.

For Example:

my pipelines are located in /Users/bajram/data/pipelines

CD into that location so a ls will list all the pipelines

execute command with 

bash location-of-script/deploy_pipelines.sh