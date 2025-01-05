#!/bin/bash
BACKUP_FILE=/backup/ternaknesia_backup.sql
DB_HOST=localhost
DB_USER=postgres
DB_NAME=ternaknesia
DB_PASSWORD=agus

# Set password sebagai variabel lingkungan
export PGPASSWORD=$DB_PASSWORD

# Cek apakah PostgreSQL siap menerima koneksi sekali
pg_isready -h $DB_HOST -U $DB_USER > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "$(date +"%Y-%m-%d %H:%M:%S") Database PostgreSQL siap. Memulai backup."

  # Backup database PostgreSQL dan menimpa file lama
  pg_dump -h $DB_HOST -U $DB_USER $DB_NAME > $BACKUP_FILE

  if [ $? -eq 0 ]; then
    echo "$(date +"%Y-%m-%d %H:%M:%S") Backup selesai dan disimpan di $BACKUP_FILE"
  else
    echo "$(date +"%Y-%m-%d %H:%M:%S") Backup gagal"
  fi
else
  echo "$(date +"%Y-%m-%d %H:%M:%S") Database PostgreSQL tidak siap, backup dilewati."
fi

# Bersihkan variabel lingkungan setelah selesai
unset PGPASSWORD
