#!/usr/bin/env bash

AWS_ACCESS_KEY_ID=PUT_YOUR_AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=PUT_YOUT_AWS_SECRET_ACCESS_KEY
BUCKET_S3=bucket
access_aws_credentials()
{
    docker run \
    --env AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    --env AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    garland/aws-cli-docker \
}

app_list_bucket_s3()
{
    access_aws_credentials
    aws s3 ls
}

upload_file_s3()
{
    access_aws_credentials
    aws s3 sync . s3://$BUCKET_S3
}

app_docker_images_build()
{
   docker build -t garland/aws-cli-docker:x.x . $@
}

case "$1" in
"build")
    app_docker_images_build ${@:2}
    ;;
"lists3")
    app_list_bucket_s3
    ;;
"push")
    app_docker_images_push
    ;;
*)
    echo -e "No se especifico un comando valido\n"
    ;;
esac