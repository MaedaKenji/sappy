# Gunakan base image PostgreSQL
FROM postgres:latest

# Salin script backup ke dalam container
COPY backup.sh /usr/local/bin/backup.sh

# Tambahkan izin eksekusi pada script
RUN chmod +x /usr/local/bin/backup.sh

# Buat direktori /backup di dalam container
RUN mkdir -p /backup

# Atur direktori kerja default
WORKDIR /backup
