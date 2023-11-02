#!/bin/bash

if [ $# != 1 ]; then
    echo 'bucket name is required'
    exit 1
fi

export BUCKET_NAME=$1
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`

echo "deb https://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install fuse gcsfuse

mkdir "$HOME/gcs-bucket"
gcsfuse $BUCKET_NAME "$HOME/gcs-bucket"