require 'spec_helper'
require 'rspec/its'

describe file('/root/backup_scripts/backup.sh') do
  its(:content) { should match /^TIMESTAMP=`date \S%y-%m-%d\w%H-%M-%S`/ }
  its(:content) { should match /^umount \/musashi_backup/ }
  its(:content) { should match /^rbd unmap \/dev\/rbd1/ }
  its(:content) { should match /^rbd map musashi_backup --pool musashi/ }
  its(:content) { should match /^mount \/dev\/rbd\/musashi\/musashi_backup \/musashi_backup/ }
  its(:content) { should match /^sh \/root\/backup_scripts\/openstack_backup.sh/ }
  its(:content) { should match /^sh \/root\/backup_scripts\/dashboard_backup.sh/ }
  its(:content) { should match /^tar -czvf musashi_backup-[$]TIMESTAMP.tar.gz \/musashi_backup/ }
  its(:content) { should match /rsync -rvaz --progress musashi_backup-[$]TIMESTAMP.tar.gz deploy@[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:(~)\// }
  its(:content) { should match /^rsync -rvaz --progress \/root\/backup_scripts\/restore.sh deploy@[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:~\// }
end

describe file('/root/keystone_data.sh') do
  its(:content) { should match /^HOSTNAME=(.*?)-mc.musashi.ph/ }
  its(:content) { should match /^EMAIL=musashi.ph/ }
  its(:content) { should match /^ADMIN_PASS=(.*?)/ }
  its(:content) { should match /^DEMO_PASS=(.*?)/ }
  its(:content) { should match /^GLANCE_PASS=(.*?)/ }
  its(:content) { should match /^NOVA_PASS=(.*?)/ }
  its(:content) { should match /^CINDER_PASS=(.*?)/ }
  its(:content) { should match /^CEILOMETER_PASS=(.*?)/ }
  its(:content) { should match /^export OS_SERVICE_TOKEN=(.*?)/ }
  its(:content) { should match /^export OS_SERVICE_ENDPOINT=http:\/\/(.*?)-mc.musashi.ph:35357\/v2.0/ }
  its(:content) { should match /^export OS_USERNAME=admin/ }
  its(:content) { should match /^export OS_PASSWORD=(.*?)/ }
  its(:content) { should match /^export OS_TENANT_NAME=admin/ }
  its(:content) { should match /^export OS_AUTH_URL=http:\/\/(.*?)-mc.musashi.ph:35357\/v2.0/ }
  its(:content) { should match /^su -s \/bin\/sh -c "keystone-manage db_sync" keystone/ }
  its(:content) { should match /^su -s \/bin\/sh -c "glance-manage db_sync" glance/ }
  its(:content) { should match /^su -s \/bin\/sh -c "nova-manage db sync" nova/ }
  its(:content) { should match /^su -s \/bin\/sh -c "cinder-manage db sync" cinder/ }
  its(:content) { should match /^keystone user-create --name=admin --pass=[$]ADMIN_PASS --email=admin@[$]EMAIL/ }
  its(:content) { should match /^keystone role-create --name=admin/ }
  its(:content) { should match /^keystone role-create --name=project_admin/ }
  its(:content) { should match /^keystone tenant-create --name=admin --description="Admin Tenant"/ }
  its(:content) { should match /^keystone user-role-add --user=admin --tenant=admin --role=admin/ }
  its(:content) { should match /^keystone user-role-add --user=admin --role=_member_ --tenant=admin/ }
  its(:content) { should match /^keystone user-create --name=demo --pass=[$]DEMO_PASS --email=demo@[$]EMAIL/ }
  its(:content) { should match /^keystone tenant-create --name=demo --description="Demo Tenant"/ }
  its(:content) { should match /^keystone user-role-add --user=demo --role=_member_ --tenant=demo/ }
  its(:content) { should match /^keystone tenant-create --name=service --description="Service Tenant"/ }
  its(:content) { should match /^keystone service-create --name=keystone --type=identity --description="OpenStack Identity"/ }
  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ identity \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:5000\/v2.0 --internalurl=http:\/\/[$]HOSTNAME:5000\/v2.0 --adminurl=http:\/\/[$]HOSTNAME:35357\/v2.0/ }
  its(:content) { should match /^keystone service-create --name=keystone --type=identityv3 --description="OpenStack Identity"/ }
  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ identityv3 \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:5000\/v3 --internalurl=http:\/\/[$]HOSTNAME:5000\/v3 --adminurl=http:\/\/[$]HOSTNAME:35357\/v3/ }
  its(:content) { should match /^keystone user-create --name=glance --pass=[$]GLANCE_PASS --email=glance@[$]EMAIL/ }
  its(:content) { should match /^keystone user-role-add --user=glance --tenant=service --role=admin/ }
  its(:content) { should match /^keystone service-create --name=glance --type=image --description="OpenStack Image Service"/ }
  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ image \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:9292 --internalurl=http:\/\/[$]HOSTNAME:9292 --adminurl=http:\/\/[$]HOSTNAME:9292/ }
  its(:content) { should match /^keystone user-create --name=nova --pass=[$]NOVA_PASS --email=nova@[$]EMAIL/ }
  its(:content) { should match /^keystone user-role-add --user=nova --tenant=service --role=admin/ }
  its(:content) { should match /^keystone service-create --name=nova --type=compute --description="OpenStack Compute"/ }
  its(:content) { should match /keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ compute \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:8774\/v2\/%\\\(tenant_id\\\)s --internalurl=http:\/\/[$]HOSTNAME:8774\/v2\/%\\\(tenant_id\\\)s --adminurl=http:\/\/[$]HOSTNAME:8774\/v2\/%\\\(tenant_id\\\)s/ }
  its(:content) { should match /^keystone service-create --name=nova --type=computev3 --description="Nova Compute Service V3"/ }
  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ computev3 \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:8774\/v3 --internalurl=http:\/\/[$]HOSTNAME:8774\/v3 --adminurl=http:\/\/[$]HOSTNAME:8774\/v3/ }
  its(:content) { should match /^keystone user-create --name=cinder --pass=[$]CINDER_PASS --email=cinder@[$]EMAIL/ }
  its(:content) { should match /^keystone user-role-add --user=cinder --tenant=service --role=admin/ }
  its(:content) { should match /^keystone service-create --name=cinder --type=volume --description="OpenStack Block Storage"/ }
  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ volume \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:8776\/v1\/%\\\(tenant_id\\\)s --internalurl=http:\/\/[$]HOSTNAME:8776\/v1\/%\\\(tenant_id\\\)s --adminurl=http:\/\/[$]HOSTNAME:8776\/v1\/%\\\(tenant_id\\\)s/ }
  its(:content) { should match /^keystone service-create --name=cinderv2 --type=volumev2 --description="OpenStack Block Storage v2"/ }
  its(:content) { should match /keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ volumev2 \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:8776\/v2\/%\\\(tenant_id\\\)s --internalurl=http:\/\/[$]HOSTNAME:8776\/v2\/%\\\(tenant_id\\\)s --adminurl=http:\/\/[$]HOSTNAME:8776\/v2\/%\\\(tenant_id\\\)s/ }
  its(:content) { should match /^keystone user-create --name=ceilometer --pass=[$]CEILOMETER_PASS --email=ceilometer@[$]EMAIL/ }
  its(:content) { should match /^keystone user-role-add --user=ceilometer --tenant=service --role=admin/ }
  its(:content) { should match /^keystone service-create --name=ceilometer --type=metering --description="Telemetry"/ }
  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ metering \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:8777 --internalurl=http:\/\/[$]HOSTNAME:8777 --adminurl=http:\/\/[$]HOSTNAME:8777/ }
  its(:content) { should match /^ADMIN_TOKEN=[$]\(\\\Wcurl http:\/\/[$]HOSTNAME:5000\/v3\/auth\/tokens \\\s*-s \\\s*-i \\\s*-H "Content-Type: application\/json" \\\s*-d '\s*{\s*"auth": {\s*"identity": {\s*"methods": \[\s*"password"\s*\],\s*"password": {\s*"user": {\s*"domain": {\s*"name": "Default"\s*},\s*"name": "admin",\s*"password": "(.*?)"\s*}\s*}\s*},\s*"scope": {\s*"project": {\s*"domain": {\s*"name": "Default"\s*},\s*"name": "admin"\s*}\s*}\s*}\s*}' \| grep \^X-Subject-Token: \| awk '{print [$]2}' \)/ }
  its(:content) { should match /^ADMIN_ID=[$]\(\\\Wcurl http:\/\/[$]HOSTNAME:5000\/v3\/auth\/tokens \\\s*-s \\\s*-H "Content-Type: application\/json" \\\s*-d '\W{\s*"auth": {\s*"identity": {\s*"methods": \[\s*"password"\s*\],\s*"password": {\s*"user": {\s*"domain": {\s*"name": "Default"\s*},\s*"name": "admin",\s*"password": "(.*?)"\s*}\s*}\s*},\s*"scope": {\s*"project": {\s*"domain": {\s*"name": "Default"\s*},\s*"name": "admin"\s*}\s*}\s*}\W}' \| jq .token.user.id \| tr -d '"'\)/ }
  its(:content) { should match /^echo "admin ID is: [$]ADMIN_ID"/ }
  its(:content) { should match /^ID_ADMIN_DOMAIN=[$]\(\\\Wcurl http:\/\/[$]HOSTNAME:5000\/v3\/domains \\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*-H "Content-Type: application\/json" \\\s*-d '\s*{\s*"domain": {\s*"enabled": true,\s*"name": "admin_domain"\s*}\s*}' \| jq .domain.id \| tr -d '"' \)/ }
  its(:content) { should match /^ID_CLOUD_ADMIN=[$]\(\\\s*curl http:\/\/[$]HOSTNAME:5000\/v3\/users \\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*-H "Content-Type: application\/json" \\\s*-d "\s*{\s*\\"user\\": {\s*\\"description\\": \\"Cloud administrator\\",\s*\\"domain_id\\": \\"[$]ID_ADMIN_DOMAIN\\",\s*\\"enabled\\": true,\s*\\"name\\": \\"cloud_admin\\",\s*\\"password\\": \\"(.*?)\\"\s*}\s*}" \| jq .user.id \| tr -d '"' \)/}
  its(:content) { should match /^echo "ID of user cloud_admin: [$]ID_CLOUD_ADMIN"/ }
	its(:content) { should match /^ADMIN_ROLE_ID=[$]\(\\\Wcurl http:\/\/[$]HOSTNAME:5000\/v3\/roles\?name=admin \\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*\| jq .roles\[0\].id \| tr -d '"' \)/ }
  its(:content) { should match /^curl -X PUT http:\/\/[$]HOSTNAME:5000\/v3\/domains\/[$]{ID_ADMIN_DOMAIN}\/users\/[$]{ID_CLOUD_ADMIN}\/roles\/[$]{ADMIN_ROLE_ID} \\\s*-s \\\s*-i \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*-H "Content-Type: application\/json"/ }
  its(:content) { should match /^curl http:\/\/[$]HOSTNAME:5000\/v3\/domains\/[$]{ID_ADMIN_DOMAIN}\/users\/[$]{ID_CLOUD_ADMIN}\/roles\\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \| jq .roles/ }
  its(:content) { should match /^curl -X PUT http:\/\/[$]HOSTNAME:5000\/v3\/domains\/default\/users\/[$]{ID_CLOUD_ADMIN}\/roles\/[$]{ADMIN_ROLE_ID} \\\s*-s \\\s*-i \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*-H "Content-Type: application\/json"/ }
  its(:content) { should match /^curl http:\/\/[$]HOSTNAME:5000\/v3\/domains\/default\/users\/[$]{ID_CLOUD_ADMIN}\/roles\\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \| jq .roles/ }
  its(:content) { should match /^ID_DEFAULT=default/ }
  its(:content) { should match /^curl -X PUT http:\/\/[$]HOSTNAME:5000\/v3\/domains\/[$]{ID_DEFAULT}\/users\/[$]{ADMIN_ID}\/roles\/[$]{ADMIN_ROLE_ID} \\\s*-s \\\s*-i \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*-H "Content-Type: application\/json"/ }
  its(:content) { should match /^curl http:\/\/[$]HOSTNAME:5000\/v3\/domains\/[$]{ID_DEFAULT}\/users\/[$]{ADMIN_ID}\/roles\\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \| jq .roles/ }
end

describe file('/root/keystonerc') do
  its(:content) { should match /^export OS_USERNAME=admin/ }
  its(:content) { should match /^export OS_PASSWORD=(.*?)/ }
  its(:content) { should match /^export OS_TENANT_NAME=admin/ }
  its(:content) { should match /^export OS_AUTH_URL=http:\/\/\b(\w+)\b-\b(\w+)\b.\b(\w+)\b.\b(\w+)\b:35357\/v2.0/ }
end

describe file('/root/.my.cnf') do
  its(:content) { should match /user=root/ }
end

describe file('/root/.ssh/config') do
  its(:content) { should match /Host github.com/ }
  its(:content) { should match /User musashi-deploy/ }
  its(:content) { should match /IdentityFile\s(~)\D\Dssh\Ddeployer_keys\Dpriv/ }
  its(:content) { should match /Port 22/ }
  its(:content) { should match /Host \b(\w+)\b-\b(\w+)\b.\b(\w+)\b.\b(\w+)\b/ }
  its(:content) { should match /Hostname ([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})/ }
  its(:content) { should match /User deploy/ }
  its(:content) { should match /IdentityFile\s(~)\D\Dssh\Ddeployer_keys\Dpriv/ }
  its(:content) { should match /Port 22/ }
  its(:content) { should match /Host \b(\w+)\b-\b(\w+)\b.\b(\w+)\b.\b(\w+)\b/ }
  its(:content) { should match /Hostname ([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})/ }
  its(:content) { should match /User deploy/ }
  its(:content) { should match /IdentityFile\s(~)\D\Dssh\Ddeployer_keys\Dpriv/ }
  its(:content) { should match /Port 22/ }
  its(:content) { should match /Host \b(\w+)\b-\b(\w+)\b.\b(\w+)\b.\b(\w+)\b/ }
  its(:content) { should match /Hostname ([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})/ }
  its(:content) { should match /User deploy/ }
  its(:content) { should match /IdentityFile\s(~)\D\Dssh\Ddeployer_keys\Dpriv/ }
  its(:content) { should match /Port 22/ }
  its(:content) { should match /Host \b(\w+)\b-\b(\w+)\b.\b(\w+)\b.\b(\w+)\b/ }
  its(:content) { should match /Hostname ([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})/ }
  its(:content) { should match /User deploy/ }
  its(:content) { should match /IdentityFile\s(~)\D\Dssh\Ddeployer_keys\Dpriv/ }
  its(:content) { should match /Port 22/ }
end