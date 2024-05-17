#!/bin/bash
DEFAULT_USER=user

sudo -i -u "${DEFAULT_USER}" cd /home/user
sudo -i -u "${DEFAULT_USER}" git clone https://github.com/GoogleCloudPlatform/google-cloud-spanner-hibernate.git
