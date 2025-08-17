# iracelog-testdb

testdata for iracelog

## Create dump on local machine

```console
docker compose exec db pg_dump -U docker -O -d iracelog_testdata > testdata.sql
```
