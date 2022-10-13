#!/bin/bash

OPTIND=1 # Reset in case getopts has been used previously in the shell.

basic_auth=test:111adaca9be9dc74ea4123029e849a8272
jenkins_address="localhost:8080"
job_name=test
file=config.xml
debug=false

show_help(){
  echo 'Usage'
  echo ''
  echo ' -h|--help This help message.'
  echo ' -b|--basic_auth Basic auth details in name:key format.'
  echo ' -j|--jenkins_address Jenkins address, default localhost:8080.'
  echo ' -n|--name Name of job, default test.'
  echo ' -f|--file Name of xml file, default config.xml.'
  echo ' -d|--debug Show debug messages.'
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -b|--basic_auth)
      basic_auth="$2"
      shift 2
      ;;
    -j|--jenkins_address)
      jenkins_address="$2"
      shift 2
      ;;
    -n|--name)
      job_name="$2"
      shift 2
      ;;
    -f|--file)
      file_name="$2"
      shift 2
      ;;
    -d|--debug)
      debug=true
      shift
      ;;
    -h|--help)
      show_help
      exit 0
      ;;
    -*|--*)
      show_help
      exit 1
      ;;
    *)
      show_help
      exit 0
      ;;
  esac
done

if $debug
then
  echo "basic_auth=$basic_auth, jenkins_address=$jenkins_address, job_name=$job_name, file=$file, leftovers = $@"
fi

curl -X POST http://${basic_auth}@${jenkins_address}/createItem?name=${job_name} \
  --header "Content-Type:text/xml" \
  --data-binary @${file}
