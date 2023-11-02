#!/bin/bash

if [ $# != 1 ]; then
    echo 'CSV file name is required'
    exit 1
fi

export CSVFILE=$1
export REGION=asia-northeast1
export CLUSTER=tokyo-cluster #update
export DOMAIN=google.com #update

while read row; do
  USERNAME=`echo ${row} | cut -d , -f 1`
  DIVISION=`echo ${row} | cut -d , -f 2`
  CONFIG=`echo ${row} | cut -d , -f 3`

  # Create Workstation
  gcloud beta workstations create ws-$USERNAME \
  --config=$CONFIG --cluster=$CLUSTER --region=$REGION \
  --labels=div=$DIVISION

  # Get current IAM policy
  ETAG=`gcloud beta workstations get-iam-policy ws-$USERNAME --config=$CONFIG --cluster=$CLUSTER --region=$REGION | grep etag`

  # Set IAM policy
  cat <<EOF > tmp-policy-$USERNAME.yaml
  bindings:
  - members:
    - user:$USERNAME@$DOMAIN
    role: roles/workstations.user
  $ETAG
  version: 1
EOF

  gcloud beta workstations set-iam-policy ws-$USERNAME tmp-policy-$USERNAME.yaml \
  --config=$CONFIG --cluster=$CLUSTER --region=$REGION

  rm tmp-policy-$USERNAME.yaml

  # Start Workstation
  gcloud beta workstations start ws-$USERNAME \
  --config=$CONFIG --cluster=$CLUSTER --region=$REGION

done < $CSVFILE
