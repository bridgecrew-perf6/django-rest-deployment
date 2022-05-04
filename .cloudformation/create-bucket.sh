#! /bin/bash

# Description:
#   Checks if any bucket with the name $bucketname exists.
#   If it does, it will continue uploading zip fil to s3.
#   If it doesn't, it will create a new bucket and upload zip file to it.

# USAGE: ./create-bucket.sh <zipfile> <bucketname>

# DEFAULTS
bucketname="django-app-bucket-umer2001"
pathToZip="./django-rest-framework-crud-v13.zip"

if [ -z "$1" ]
then
  echo "No path to zip file was provided, using default: $pathToZip"
else
    pathToZip="$1"
fi

if [ -z "$2" ]
then
  echo "No bucket name provided, using default: $bucketname"
else
    bucketname="$2"
fi

# check if bucket is already created with aws cli
if aws s3api head-bucket --bucket "$bucketname" 2>/dev/null; then
    echo "Bucket $bucketname already exists"
else
    echo "Creating AWS S3 Bucket named : $bucketname"
    aws s3api create-bucket \
        --bucket "$bucketname"
fi

echo "uploading files to S3 Bucket named : $bucketname"
aws s3 cp $pathToZip s3://$bucketname