#!/bin/sh
gcloud auth login
export AUTH_TOKEN=$(gcloud auth print-access-token)
export LOCATION=us-west1
export INSTANCE_ID=bajram-test-cdf
export CDAP_ENDPOINT=$(gcloud beta data-fusion instances describe \
    --location=${LOCATION} \
    --format="value(apiEndpoint)" \
  ${INSTANCE_ID})
echo AUTH_TOKEN = $AUTH_TOKEN
echo LOCATION = $LOCATION
echo INSTANCE_ID = $INSTANCE_ID
echo CDAP_ENDPOINT = $CDAP_ENDPOINT
for file in $(ls); do
    pipeline=$(echo $file | awk -F'[-]' '{print $1}')
    echo "deploying pipeline $pipeline"
    curl -X PUT -H "Authorization: Bearer ${AUTH_TOKEN}" "${CDAP_ENDPOINT}/v3/namespaces/default/apps/$pipeline" -d @${file}
    echo \n
done