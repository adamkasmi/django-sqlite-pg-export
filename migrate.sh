
---

**migrate.sh**

```bash
#!/bin/bash

# Script to migrate Django SQLite database to PostgreSQL using pgloader

# Check if pgloader is installed
if ! command -v pgloader &> /dev/null
then
    echo "pgloader could not be found. Please install it before proceeding."
    exit
fi

# Load data from SQLite to PostgreSQL using migrate.load configuration
pgloader migrate.load

# Provide feedback
if [ $? -eq 0 ]; then
    echo "Migration successful!"
else
    echo "Migration failed. Check the configuration and try again."
fi
