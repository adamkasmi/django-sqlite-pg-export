# Django SQLite to PostgreSQL Migration

This guide will assist you in migrating your Django project from SQLite to PostgreSQL using the `pgloader` tool.

## Prerequisites

- A Django project currently using SQLite.
- PostgreSQL server installed and running.
- `pgloader` installed.

## Steps

1. **Prepare your PostgreSQL Database**:
   Ensure PostgreSQL is running, and create an empty database for your Django project.

2. **Update `migrate.load`**:
   Update the `migrate.load` script file provided in this repository with the paths to your SQLite database and PostgreSQL credentials.

3. **Execute the Migration Script**:
   Run the migration script using:
   ```bash
   chmod +x migrate.sh
   ./migrate.sh
