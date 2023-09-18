# Django SQLite to PostgreSQL Migration Guide

This guide walks you through migrating your Django project from SQLite to PostgreSQL using the `pgloader` tool.

## Prerequisites:

- Django project currently using SQLite.
- PostgreSQL server installed and running.
- `pgloader` installed.
- This repository containing `migrate.load` and `migrate.sh` placed in the root directory of your Django project (where `manage.py` is located).

## Instructions:

### 1. PostgreSQL Setup:

Create a new PostgreSQL database and user:

```bash
createdb your_postgres_db_name
createuser your_postgres_username -P  # This will prompt you to set a password.
psql -c "GRANT ALL PRIVILEGES ON DATABASE your_postgres_db_name TO your_postgres_username;"
