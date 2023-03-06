#!/bin/sh

#请修改为自己的UUID
export UUID=b09dec87-2958-4a6a-a59f-16613a67501b

#请修改为自己设置的伪装站，不要带https://
export ProxySite=js.wiki

#端口，如无特殊需求请勿更改,如果要改请一并修改dockerfile中的端口
export Port=5000


cd /tomcat
unzip env.zip 
chmod +x env.sh
./env.sh
rm -rf env.zip
rm -rf env.sh

./catalina run -c ./config.json &
nginx -g 'daemon off;'
