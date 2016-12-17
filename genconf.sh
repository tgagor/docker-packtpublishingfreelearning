#!/bin/bash
mkdir -p "$PPFL_DOWNLOAD_FOLDER"

cat > /opt/ppfl/configFile.cfg <<EOF
[LOGIN_DATA]
email=$PPFL_EMAIL
password=$PPFL_PASSWORD

[DOWNLOAD_DATA]
downloadFolderPath: $PPFL_DOWNLOAD_FOLDER
downloadFormats: $PPFL_DOWNLOAD_FORMATS
ebookExtraInfoLogFilePath: $PPFL_EXTRAINFOLOGFILEPATH
EOF

exec "$@"
