export IMAGE_TAG=
export PROJECT_ID=
export REPO=
export REGION=

# Create repo
gcloud artifacts repositories create ${REPO} \
--repository-format=docker \
--location=${REGION} \
--description="my conatiner repo"

# Enable Kanico cache
gcloud config set builds/use_kaniko True
gcloud config set builds/kaniko_cache_ttl 6

# Build workstation image
gcloud builds submit --tag ${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO}/my-workstation:${IMAGE_TAG}
