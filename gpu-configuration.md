# Create GPU Workstation
export REGION=asia-northeast1
export CLUSTER=tokyo-cluster
export CONFIG=config-gpu-tokyo
export MACHINE_TYPE=n1-standard-8

gcloud beta workstations configs create $CONFIG \
  --cluster=$CLUSTER --region=$REGION --machine-type=$MACHINE_TYPE \
  --accelerator-type=nvidia-tesla-t4 --accelerator-count=1 \
  --idle-timeout=86400 \
  --pd-disk-size=100 --pd-disk-type=pd-ssd