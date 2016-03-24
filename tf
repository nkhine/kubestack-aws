#!/usr/bin/env bash

terraform_command=$1
shift

echo "current param is now: $terraform_command"

options=""
changes=false

# Use > 0 to consume one or more arguments per pass in the loop (e.g.
# some arguments don't have a corresponding value to go with it such
while [[ $# > 0 ]]; do
  key="$1"

  changes=true

  case $key in
      -d=*|--new-discovery-token=*)
        echo generating discovery token...
        size="${key#*=}"
        discovery_request_url="https://discovery.etcd.io/new?size=$size"
        echo discovery_request_url="${discovery_request_url}"
        discovery_url=`curl -s "$discovery_request_url"`
        echo generated: ${discovery_url}
        export TF_VAR_discovery_url=$discovery_url
      ;;
      *)
        options="${options} ${key}"
        export TF_OPTIONS="$options"
      ;;
  esac
  shift # past argument or value
done


if [ "$changes" = true ]; then
  echo saving changes to state file: .tf.state
  echo "TF_VAR_discovery_url=\"$TF_VAR_discovery_url\"; export TF_VAR_discovery_url" > .tf.state
  echo "TF_OPTIONS=\"$TF_OPTIONS\"; export TF_OPTIONS" >> .tf.state
else
  echo sroucing previously saved environment
  source .tf.state
fi


echo "executing 'terraform $terraform_command $TF_OPTIONS'"
terraform $terraform_command $TF_OPTIONS
