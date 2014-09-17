require 'spec_helper'
require 'rspec/its'

describe file('/root/keystone_data.sh') do
  #!/bin/bash

  # Script Variables
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

  # DB sync for keystone
  its(:content) { should match /^su -s \/bin\/sh -c "keystone-manage db_sync" keystone/ }

  # DB sync for glance
  its(:content) { should match /^su -s \/bin\/sh -c "glance-manage db_sync" glance/ }

  # DB sync for nova
  its(:content) { should match /^su -s \/bin\/sh -c "nova-manage db sync" nova/ }

  # DB sync for cinder
  its(:content) { should match /^su -s \/bin\/sh -c "cinder-manage db sync" cinder/ }

  # Create an administrative user called admin
  its(:content) { should match /^keystone user-create --name=admin --pass=[$]ADMIN_PASS --email=admin@[$]EMAIL/ }

  # Create a role for administrative tasks called admin
  its(:content) { should match /^keystone role-create --name=admin/ }

  its(:content) { should match /^keystone role-create --name=project_admin/ }
  # Create a tenant for an administrative user and a tenant for other OpenStack services to use
  its(:content) { should match /^keystone tenant-create --name=admin --description="Admin Tenant"/ }

  # Link the admin user, admin role, and admin tenant together 
  its(:content) { should match /^keystone user-role-add --user=admin --tenant=admin --role=admin/ }

  # Link the admin user, _member_ role, and admin tenant
  its(:content) { should match /^keystone user-role-add --user=admin --role=_member_ --tenant=admin/ }

  # Create the demo user
  its(:content) { should match /^keystone user-create --name=demo --pass=[$]DEMO_PASS --email=demo@[$]EMAIL/ }

  # Create the demo tenant
  its(:content) { should match /^keystone tenant-create --name=demo --description="Demo Tenant"/ }

  # Link the demo user, _member_ role, and demo tenant
  its(:content) { should match /^keystone user-role-add --user=demo --role=_member_ --tenant=demo/ }

  # Create the service tenant
  its(:content) { should match /^keystone tenant-create --name=service --description="Service Tenant"/ }

  # Create a service entry for the Identity Service
  its(:content) { should match /^keystone service-create --name=keystone --type=identity --description="OpenStack Identity"/ }

  # Specify an API endpoint for the Identity Service by using the returned service ID
  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ identity \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:5000\/v2.0 --internalurl=http:\/\/[$]HOSTNAME:5000\/v2.0 --adminurl=http:\/\/[$]HOSTNAME:35357\/v2.0/ }
	
  # keystone v3
  its(:content) { should match /^keystone service-create --name=keystone --type=identityv3 --description="OpenStack Identity"/ }

  # Specify the V3 API endpoint for the Identity Service by using the returned service ID
  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ identityv3 \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:5000\/v3 --internalurl=http:\/\/[$]HOSTNAME:5000\/v3 --adminurl=http:\/\/[$]HOSTNAME:35357\/v3/ }

  # Create a glance user that the Image Service can use to authenticate with the Identity service
  its(:content) { should match /^keystone user-create --name=glance --pass=[$]GLANCE_PASS --email=glance@[$]EMAIL/ }

  # Link the glance user, admin role, and service tenant
  its(:content) { should match /^keystone user-role-add --user=glance --tenant=service --role=admin/ }

  # Create a service entry for the Image Service
  its(:content) { should match /^keystone service-create --name=glance --type=image --description="OpenStack Image Service"/ }

  # Register the Image Service with the Identity service so that other OpenStack services can locate it
  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ image \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:9292 --internalurl=http:\/\/[$]HOSTNAME:9292 --adminurl=http:\/\/[$]HOSTNAME:9292/ }

  # Create a nova user that Compute uses to authenticate with the Identity Service
  its(:content) { should match /^keystone user-create --name=nova --pass=[$]NOVA_PASS --email=nova@[$]EMAIL/ }

  # Link nova user, admin, and service tenant
  its(:content) { should match /^keystone user-role-add --user=nova --tenant=service --role=admin/ }

  # Create a service entry for the Compute Service
  its(:content) { should match /^keystone service-create --name=nova --type=compute --description="OpenStack Compute"/ }

  # Register Compute with the Identity Service so that other OpenStack services can locate it
  its(:content) { should match /keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ compute \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:8774\/v2\/%\\\(tenant_id\\\)s --internalurl=http:\/\/[$]HOSTNAME:8774\/v2\/%\\\(tenant_id\\\)s --adminurl=http:\/\/[$]HOSTNAME:8774\/v2\/%\\\(tenant_id\\\)s/ }

  # Register V3 Compute
  its(:content) { should match /^keystone service-create --name=nova --type=computev3 --description="Nova Compute Service V3"/ }

  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ computev3 \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:8774\/v3 --internalurl=http:\/\/[$]HOSTNAME:8774\/v3 --adminurl=http:\/\/[$]HOSTNAME:8774\/v3/ }
  # Create a cinder user
  its(:content) { should match /^keystone user-create --name=cinder --pass=[$]CINDER_PASS --email=cinder@[$]EMAIL/ }

  # Link cinder user, admin and service tenant
  its(:content) { should match /^keystone user-role-add --user=cinder --tenant=service --role=admin/ }

  # Create service entry for the Block Storage
  its(:content) { should match /^keystone service-create --name=cinder --type=volume --description="OpenStack Block Storage"/ }

  # Register the Block Storage service with the Identity service so that other OpenStack services can locate it
  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ volume \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:8776\/v1\/%\\\(tenant_id\\\)s --internalurl=http:\/\/[$]HOSTNAME:8776\/v1\/%\\\(tenant_id\\\)s --adminurl=http:\/\/[$]HOSTNAME:8776\/v1\/%\\\(tenant_id\\\)s/ }

  # Create service entry for Version 2 Block Storage
  its(:content) { should match /^keystone service-create --name=cinderv2 --type=volumev2 --description="OpenStack Block Storage v2"/ }

  # Register a service and endpoint for version 2 of the Block Storage service API
  its(:content) { should match /keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ volumev2 \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:8776\/v2\/%\\\(tenant_id\\\)s --internalurl=http:\/\/[$]HOSTNAME:8776\/v2\/%\\\(tenant_id\\\)s --adminurl=http:\/\/[$]HOSTNAME:8776\/v2\/%\\\(tenant_id\\\)s/ }

  # Create a ceilometer user
  its(:content) { should match /^keystone user-create --name=ceilometer --pass=[$]CEILOMETER_PASS --email=ceilometer@[$]EMAIL/ }

  # Link ceilometer user, admin, and service tenant
  its(:content) { should match /^keystone user-role-add --user=ceilometer --tenant=service --role=admin/ }

  # Create service entry for Telemetry
  its(:content) { should match /^keystone service-create --name=ceilometer --type=metering --description="Telemetry"/ }

  # Register the Telemetry service with the Identity Service
  its(:content) { should match /^keystone endpoint-create --service-id=[$]\(keystone service-list \| awk '\/ metering \/ {print [$]2}'\) --publicurl=http:\/\/[$]HOSTNAME:8777 --internalurl=http:\/\/[$]HOSTNAME:8777 --adminurl=http:\/\/[$]HOSTNAME:8777/ }


  #KEYSTONE V3 MIGRATION
  #http://www.florentflament.com/blog/setting-keystone-v3-domains.html
  its(:content) { should match /^ADMIN_TOKEN=[$]\(\\\Wcurl http:\/\/[$]HOSTNAME:5000\/v3\/auth\/tokens \\\s*-s \\\s*-i \\\s*-H "Content-Type: application\/json" \\\s*-d '\s*{\s*"auth": {\s*"identity": {\s*"methods": \[\s*"password"\s*\],\s*"password": {\s*"user": {\s*"domain": {\s*"name": "Default"\s*},\s*"name": "admin",\s*"password": "(.*?)"\s*}\s*}\s*},\s*"scope": {\s*"project": {\s*"domain": {\s*"name": "Default"\s*},\s*"name": "admin"\s*}\s*}\s*}\s*}' \| grep \^X-Subject-Token: \| awk '{print [$]2}' \)/ }

  its(:content) { should match /^ADMIN_ID=[$]\(\\\Wcurl http:\/\/[$]HOSTNAME:5000\/v3\/auth\/tokens \\\s*-s \\\s*-H "Content-Type: application\/json" \\\s*-d '\W{\s*"auth": {\s*"identity": {\s*"methods": \[\s*"password"\s*\],\s*"password": {\s*"user": {\s*"domain": {\s*"name": "Default"\s*},\s*"name": "admin",\s*"password": "(.*?)"\s*}\s*}\s*},\s*"scope": {\s*"project": {\s*"domain": {\s*"name": "Default"\s*},\s*"name": "admin"\s*}\s*}\s*}\W}' \| jq .token.user.id \| tr -d '"'\)/ }

  its(:content) { should match /^echo "admin ID is: [$]ADMIN_ID"/ }

  its(:content) { should match /^ID_ADMIN_DOMAIN=[$]\(\\\Wcurl http:\/\/[$]HOSTNAME:5000\/v3\/domains \\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*-H "Content-Type: application\/json" \\\s*-d '\s*{\s*"domain": {\s*"enabled": true,\s*"name": "admin_domain"\s*}\s*}' \| jq .domain.id \| tr -d '"' \)/ }

  #Then we can create our cloud_admin user, within the admin_domain domain.
  its(:content) { should match /^ID_CLOUD_ADMIN=[$]\(\\\s*curl http:\/\/[$]HOSTNAME:5000\/v3\/users \\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*-H "Content-Type: application\/json" \\\s*-d "\s*{\s*\\"user\\": {\s*\\"description\\": \\"Cloud administrator\\",\s*\\"domain_id\\": \\"[$]ID_ADMIN_DOMAIN\\",\s*\\"enabled\\": true,\s*\\"name\\": \\"cloud_admin\\",\s*\\"password\\": \\"(.*?)\\"\s*}\s*}" \| jq .user.id \| tr -d '"' \)/}

  its(:content) { should match /^echo "ID of user cloud_admin: [$]ID_CLOUD_ADMIN"/ }
  #And we grant to our user cloud_admin the admin role on domain admin_domain.
	its(:content) { should match /^ADMIN_ROLE_ID=[$]\(\\\Wcurl http:\/\/[$]HOSTNAME:5000\/v3\/roles\?name=admin \\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*\| jq .roles\[0\].id \| tr -d '"' \)/ }

  its(:content) { should match /^curl -X PUT http:\/\/[$]HOSTNAME:5000\/v3\/domains\/[$]{ID_ADMIN_DOMAIN}\/users\/[$]{ID_CLOUD_ADMIN}\/roles\/[$]{ADMIN_ROLE_ID} \\\s*-s \\\s*-i \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*-H "Content-Type: application\/json"/ }

  its(:content) { should match /^curl http:\/\/[$]HOSTNAME:5000\/v3\/domains\/[$]{ID_ADMIN_DOMAIN}\/users\/[$]{ID_CLOUD_ADMIN}\/roles\\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \| jq .roles/ }

  #We grant cloud_admin the admin role on domain default
  its(:content) { should match /^curl -X PUT http:\/\/[$]HOSTNAME:5000\/v3\/domains\/default\/users\/[$]{ID_CLOUD_ADMIN}\/roles\/[$]{ADMIN_ROLE_ID} \\\s*-s \\\s*-i \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*-H "Content-Type: application\/json"/ }

  its(:content) { should match /^curl http:\/\/[$]HOSTNAME:5000\/v3\/domains\/default\/users\/[$]{ID_CLOUD_ADMIN}\/roles\\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \| jq .roles/ }

  #We grant admin the admin role on domain default
  its(:content) { should match /^ID_DEFAULT=default/ }
  its(:content) { should match /^curl -X PUT http:\/\/[$]HOSTNAME:5000\/v3\/domains\/[$]{ID_DEFAULT}\/users\/[$]{ADMIN_ID}\/roles\/[$]{ADMIN_ROLE_ID} \\\s*-s \\\s*-i \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \\\s*-H "Content-Type: application\/json"/ }

  its(:content) { should match /^curl http:\/\/[$]HOSTNAME:5000\/v3\/domains\/[$]{ID_DEFAULT}\/users\/[$]{ADMIN_ID}\/roles\\\s*-s \\\s*-H "X-Auth-Token: [$]ADMIN_TOKEN" \| jq .roles/ }
end