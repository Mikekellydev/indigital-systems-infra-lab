#!/bin/bash

# renew-certs-script.sh
# Automated certificate renewal and deployment

set -e

CERT_DIR="/etc/ssl/myapp"
BACKUP_DIR="/etc/ssl/myapp/backup-$(date +%F)"
SERVICE_NAME="nginx"

echo "Starting certificate renewal..."

# Backup existing certs
mkdir -p "$BACKUP_DIR"
cp "$CERT_DIR"/* "$BACKUP_DIR"/

echo "Backed up existing certificates to $BACKUP_DIR"

# Renew certificates (placeholder for real ACME client)
if command -v certbot >/dev/null 2>&1; then
    certbot renew --quiet
else
    echo "Certbot not installed. Skipping ACME renewal."
fi

# Validate new certificates
openssl x509 -in "$CERT_DIR/fullchain.pem" -noout -text >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Certificate validation failed. Restoring backup."
    cp "$BACKUP_DIR"/* "$CERT_DIR"/
    exit 1
fi

echo "Certificate validation successful."

# Reload service
systemctl reload "$SERVICE_NAME"

echo "Certificate renewal complete."
