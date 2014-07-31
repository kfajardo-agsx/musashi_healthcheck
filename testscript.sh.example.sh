export USER_PASS=12345678
export EMAIL=musashi.ph
export OS_USERNAME=admin
export OS_PASSWORD=klnm12
export OS_TENANT_NAME=admin
export OS_AUTH_URL=http://mc1.musashi.ph:35357/v2.0

keystone tenant-create --name=proj0 --description='test'
keystone user-create --name=pa0 --pass="$USER_PASS" --email=qa_musashi+pa0@"$EMAIL" --tenant proj0
keystone user-role-add --user pa0 --tenant proj0 --role project_admin
keystone user-role-remove --user pa0 --tenant proj0 --role _member_

keystone user-create --name=pm0 --pass="$USER_PASS" --email=qa_musashi+pm0@"$EMAIL" --tenant proj0
