# Django SQLite to PostgreSQL Migration Guide

Migrate your Django project from SQLite to PostgreSQL using the `pgloader` tool.

## Prerequisites
- A Django project currently using SQLite.
- PostgreSQL server installed and running.
- `pgloader` installed on your system.

## Steps

### 1. PostgreSQL Setup & Configuration
To set up your PostgreSQL and configure the migration:

1. **Setup PostgreSQL:**
   ```bash
   createdb your_postgres_db_name
   createuser your_postgres_username -P
   psql -c "GRANT ALL PRIVILEGES ON DATABASE your_postgres_db_name TO your_postgres_username;"
Edit Configuration File: In your Django project's root directory, find the migrate.load file and replace the placeholders with your actual data:

plaintext
Copy code
LOAD DATABASE
FROM sqlite:////full/path/to/your/sqlite/db
INTO postgresql://your_postgres_username:your_postgres_password@localhost/your_postgres_db_name

WITH include no tables,
     create tables,
     create indexes,
     reset sequences,
     data only

ALTER SCHEMA 'main' RENAME TO 'public';
Migration with migrate.sh: Make the migration script executable and run it:

bash
Copy code
chmod +x migrate.sh
./migrate.sh
Update Django Settings: Modify your settings.py file to use the PostgreSQL database:

python
Copy code
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'your_postgres_db_name',
        'USER': 'your_postgres_username',
        'PASSWORD': 'your_postgres_password',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
