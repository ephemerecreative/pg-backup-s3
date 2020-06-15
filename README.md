# pg-backup-s3

_NOTE: We are trying this out in one of our projects, but haven't tested it in a real production environment._

Simple utility to backup a Postgres database to S3-compatible storage.

[Sample k8s configuration.](./examples/k8s)

## Environment Variables

| Environment Variable Name | Environment Variable Description                                                                                                                                  |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `S3_ENDPOINT`             | The endpoint of the S3-compatible service you would like to use.                                                                                                  |
| `S3_REGION`               | The region of the S3-compatible service you would like to use.                                                                                                    |
| `S3_ACCESS_KEY_ID`        | Your S3 access key ID.                                                                                                                                            |
| `S3_SECRET_ACCESS_KEY`    | Your S3 secret access key.                                                                                                                                        |
| `S3_BUCKET`               | Your S3 bucket name.                                                                                                                                              |
| `BUCKET_PATH`             | The path within the bucket that you would like to save the backups in.                                                                                            |
| `PGUSER`                  | The postgres database user.                                                                                                                                       |
| `PGPASSWORD`              | The postgres database password.                                                                                                                                   |
| `PGHOST`                  | The postgres database host.                                                                                                                                       |
| `PGPORT`                  | The postgres database port.                                                                                                                                       |
| `PGDATABASE`              | The postgres database name.                                                                                                                                       |
| `PG_DUMP_FLAGS`           | `pg_dump` is used to generate the backups. By default we export using `-Fc`, but you can replace these flags with your preferred configuration.                   |
| `OTHER_S3CMD_FLAGS`       | We use [s3cmd](https://s3tools.org/usage) to upload the backup file. If you would like to use any other flags to modify the command, add them with this variable. |

