#!/bin/bash
#Got inforamtion from:
#https://linuxhandbook.com/create-systemd-services/
echo "[Unit]" > webserver.service
echo "Description=Apache web server" >> webserver.service
echo "After=network.target" >> webserver.service
echo "Before=nextcloud-web.service" >> webserver.service
echo "" >> webserver.service
echo "[Service]" >> webserver.service
echo "ExecStart=nohup busybox httpd -f -p 80 &" >> webserver.service
echo "ExecReload=/usr/local/apache2/bin/httpd -k graceful" >> webserver.service
echo "Type=simple" >> webserver.service
echo "Restart=always" >> webserver.service
echo "" >> webserver.service
echo "[Install]" >> webserver.service
echo "WantedBy=multi-user.target" >> webserver.service

sudo mv webserver.service /etc/systemd/system/webserver.service
sudo chown root:root /etc/systemd/system/webserver.service
sudo chmod 755 /etc/systemd/system/webserver.service
sudo systemctl enable webserver.service
