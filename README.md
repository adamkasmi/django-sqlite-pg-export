# Django SQLite to PostgreSQL Migration Guide
This guide walks you through migrating your Django project from SQLite to PostgreSQL using the pgloader tool.

Prerequisites:
Django project currently using SQLite.
PostgreSQL server installed and running.
pgloader installed.
migrate.load configuration file placed in the root directory of your Django project (where manage.py is located).
Instructions:
1. PostgreSQL Setup:
Create a new PostgreSQL database and user:

bash
Copy code
createdb your_postgres_db_name
createuser your_postgres_username -P  # This will prompt you to set a password.
psql -c "GRANT ALL PRIVILEGES ON DATABASE your_postgres_db_name TO your_postgres_username;"
2. Configuration:
Open the migrate.load file in the root directory of your Django project. Replace placeholders (/full/path/to/your/sqlite/db, your_postgres_username, your_postgres_password, and your_postgres_db_name) with your actual details:

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
3. Migration:
In the root directory of your Django project, make the migration script executable:

bash
Copy code
chmod +x migrate.sh
Run the script:

bash
Copy code
./migrate.sh
4. Update Django Settings:
Modify the DATABASES configuration in your Django project's settings.py:

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
5. Additional Steps:
Install the psycopg2 PostgreSQL adapter:

bash
Copy code
pip install psycopg2
Run Django migrations:

bash
Copy code
python manage.py migrate
Test your Django application thoroughly for data integrity and functionality.

