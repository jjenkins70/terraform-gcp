readme.md
This document is a sample terraform setup that will create 1 GCS bucket, 1 VPC network & subnet, and deploy 1 compute instance.

More will be added as I continue to learn / play with terraform.

## STATUS: 3/4/19 
- Working as expected...now to add in firewalls and such.

## STEPS:
-- create a bucket for remote state files to live (this is manual)
make sure it matches your region (if needed) 
gsutil mb gs://<bucketname>

