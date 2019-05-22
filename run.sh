#!/bin/bash

if [ ! -f /home/openplc/scripts/script.st ]; then
    echo "Structured text file missing!"
    exit 1
fi

if [ ! -f /home/openplc/scripts/mbconfig.cfg ]; then
    echo "Config file missing!"
    exit 1
fi

SQL_SCRIPT="INSERT INTO Programs (Name, Description, File, Date_upload) VALUES ('Test', 'Desc', 'script.st', strftime('%s', 'now'));"
SQL_DEVICE="INSERT INTO Slave_dev (dev_name, dev_type, slave_id, ip_address, ip_port, di_start, di_size, coil_start, coil_size, ir_start, ir_size, hr_read_start, hr_read_size, hr_write_start, hr_write_size) VALUES ('Testdevice', 'TCP', 0, '127.0.0.1', 502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);"
SQL_AUTOST="UPDATE Settings SET Value = 'true' WHERE Key = 'Start_run_mode';"

cp /home/openplc/scripts/script.st /home/openplc/OpenPLC_v3/webserver/st_files
sqlite3 /home/openplc/OpenPLC_v3/webserver/openplc.db "$SQL_SCRIPT"

cp /home/openplc/scripts/mbconfig.cfg /home/openplc/OpenPLC_v3/webserver
sqlite3 /home/openplc/OpenPLC_v3/webserver/openplc.db "$SQL_DEVICE"

sqlite3 /home/openplc/OpenPLC_v3/webserver/openplc.db "$SQL_AUTOST"

sudo /home/openplc/OpenPLC_v3/start_openplc.sh
