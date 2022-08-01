create table
if not exists migration_log
(
  id VARCHAR PRIMARY KEY,
  run_date TIMESTAMP,
  value VARCHAR
);