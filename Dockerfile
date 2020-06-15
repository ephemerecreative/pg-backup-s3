FROM python:3.8-buster

RUN apt-get update
RUN apt-get install -y postgresql-client python3 python3-pip
RUN pip3 install s3cmd

ENV PG_DUMP_FLAGS="-Fc"

CMD export BACKUPNAME="$PGDATABASE.$(date +"%s").dump" \
    && export BACKUPPATH="/tmp/$BACKUPNAME" \
    && pg_dump $PG_DUMP_FLAGS > $BACKUPPATH \
    && s3cmd \
        --host=$S3_ENDPOINT \
        --access_key=$S3_ACCESS_KEY_ID \
        --secret_key=$S3_SECRET_ACCESS_KEY \
        --region=$S3_REGION \
        --host-bucket=$S3_BUCKET \
        --acl-private \
        $OTHER_S3CMD_FLAGS \
        put $BACKUPPATH "s3://$S3_BUCKET/$BUCKET_PATH/$BACKUPNAME"