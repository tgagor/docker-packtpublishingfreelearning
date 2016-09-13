#!/bin/bash
mkdir -p "$DOWNLOAD_FOLDER"

cat > /opt/ppfl/configFile.cfg <<EOF
[LOGIN_DATA]
email=$EMAIL
password=$PASSWORD

[DOWNLOAD_DATA]
downloadFolderPath: $DOWNLOAD_FOLDER
downloadFormats: $DOWNLOAD_FORMATS
EOF

exec "$@"
