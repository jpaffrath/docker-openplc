#!/bin/bash

if [ ! -f /home/openplc/scripts/script.st ]; then
    echo "Structured text file missing!"
    exit 1
fi

cp /home/openplc/scripts/script.st /home/openplc/OpenPLC_v3/webserver/st_files

sqlite3 /home/openplc/OpenPLC_v3/webserver/openplc.db 'INSERT INTO Programs (Name, Description, File, Date_upload) VALUES ("Test", "Desc", "script.st", strftime("%s", "now"));'

/home/openplc/OpenPLC_v3/start_openplc.sh
