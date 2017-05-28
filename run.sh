#!/bin/sh
mkdir -p "$PPFL_DOWNLOAD_FOLDER"

cat > /opt/ppfl/configFile.cfg <<EOF
[LOGIN_DATA]
email=$PPFL_EMAIL
password=$PPFL_PASSWORD

[DOWNLOAD_DATA]
download_folder_path: $PPFL_DOWNLOAD_FOLDER
download_formats: $PPFL_DOWNLOAD_FORMATS
ebook_extra_info_log_file_path: $PPFL_EXTRAINFOLOGFILEPATH
EOF

exec "$@"
