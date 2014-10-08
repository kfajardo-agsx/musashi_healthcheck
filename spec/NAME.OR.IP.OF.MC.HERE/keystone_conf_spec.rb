require 'spec_helper'
require 'rspec/its'

describe file('/etc/keystone/keystone.conf') do
  # ============ Options defined in keystone ============ 
  its(:content) { should match /admin_token = (.*?)/ }     #To be updated
  its(:content) { should match /public_bind_host=\d+.\d+.\d+.\d+/ }
  its(:content) { should match /admin_bind_host=\d+.\d+.\d+.\d+/ }
  #compute_port=8774
  #admin_port=35357
  #public_port=5000
  #public_endpoint=http://localhost:%(public_port)s/
  #admin_endpoint=http://localhost:%(admin_port)s/
  #onready=<None>
  #max_request_body_size=114688
  #max_param_size=64
  #max_token_size=8192
  #member_role_id=9fe2ff9ee4384b1894a90878d3e92bab
  #member_role_name=_member_
  #crypt_strength=40000
  #tcp_keepalive=false
  #tcp_keepidle=600
  #list_limit=<None>
  #domain_id_immutable=true
	
  # ============ Options defined in oslo.messaging ============
  #amqp_durable_queues=false
  #amqp_auto_delete=false
  #rpc_conn_pool_size=30
  #allowed_rpc_exception_modules=oslo.messaging.exceptions,nova.exception,cinder.exception,exceptions
  #qpid_hostname=localhost
  #qpid_port=5672
  #qpid_hosts=$qpid_hostname:$qpid_port
  #qpid_username=
  #qpid_password=
  #qpid_sasl_mechanisms=
  #qpid_heartbeat=60
  #qpid_protocol=tcp
  #qpid_tcp_nodelay=true
  #qpid_topology_version=1
  #kombu_ssl_version=
  #kombu_ssl_keyfile=
  #kombu_ssl_certfile=
  #kombu_ssl_ca_certs=
  #kombu_reconnect_delay=1.0
  #rabbit_host=localhost
  #rabbit_port=5672
  its(:content) { should match /rabbit_hosts=[$]rabbit_host:[$]rabbit_port/ }
  #rabbit_use_ssl=false
  #rabbit_userid=guest
  #rabbit_password=guest
  #rabbit_login_method=AMQPLAIN
  #rabbit_virtual_host=/
  #rabbit_retry_interval=1
  #rabbit_retry_backoff=2
  #rabbit_max_retries=0
  #rabbit_ha_queues=false
  #fake_rabbit=false
  #rpc_zmq_bind_address=*
  #rpc_zmq_matchmaker=oslo.messaging._drivers.matchmaker.MatchMakerLocalhost
  #rpc_zmq_port=9501
  #rpc_zmq_contexts=1
  #rpc_zmq_topic_backlog=<None>
  #rpc_zmq_ipc_dir=/var/run/openstack
  #rpc_zmq_host=keystone
  #rpc_cast_timeout=30
  #matchmaker_heartbeat_freq=300
  #matchmaker_heartbeat_ttl=600
  #host=127.0.0.1
  #port=6379
  #password=<None>
  #rpc_thread_pool_size=64
  #notification_driver=
  #notification_topics=notifications
  #rpc_response_timeout=60
  #transport_url=<None>
  #rpc_backend=rabbit
  #control_exchange=openstack

  # ============ Options defined in keystone.notifications ============
  #default_publisher_id=<None>
  #keystone_ec2_url=http://localhost:5000/v2.0/ec2tokens
  #keystone_ec2_keyfile=<None>
  #keystone_ec2_certfile=<None>
  #keystone_ec2_cafile=<None>
  #keystone_ec2_insecure=false
	
  # ============ Options defined in keystone.openstack.common.eventlet_backdoor ============
  #backdoor_port=<None>

  # ============ Options defined in keystone.openstack.common.lockutils ============
  #disable_process_locking=false
  #lock_path=<None>
	
  # ============ Options defined in keystone.openstack.common.log
  #debug=false
  #verbose=false
  #use_stderr=true
  #logging_context_format_string=%(asctime)s.%(msecs)03d %(process)d %(levelname)s %(name)s [%(request_id)s %(user_identity)s] %(instance)s%(message)s
  #logging_default_format_string=%(asctime)s.%(msecs)03d %(process)d %(levelname)s %(name)s [-] %(instance)s%(message)s
  #logging_debug_format_suffix=%(funcName)s %(pathname)s:%(lineno)d
  #logging_exception_prefix=%(asctime)s.%(msecs)03d %(process)d TRACE %(name)s %(instance)s
  #default_log_levels=amqp=WARN,amqplib=WARN,boto=WARN,qpid=WARN,sqlalchemy=WARN,suds=INFO,iso8601=WARN,requests.packages.urllib3.connectionpool=WARN
  #publish_errors=false
  #fatal_deprecations=false
  #instance_format="[instance: %(uuid)s] "
  #instance_uuid_format="[instance: %(uuid)s] "
  #log_config_append=<None>
  #log_format=<None>
  #log_date_format=%Y-%m-%d %H:%M:%S
  #log_file=<None>
  its(:content) { should match /log_dir = \/var\/log\/keystone/ }
  #use_syslog=false
  #use_syslog_rfc_format=false
  #syslog_log_facility=LOG_USER

  # ============ Options defined in keystone.openstack.common.policy
  #policy_file=policy.json
  #policy_default_rule=default

  # ============ Options defined in keystone
  #[assignment]
  #driver=<None>
  #caching=true
  #cache_time=<None>
  #list_limit=<None>
  #[auth]
  # Options defined in keystone
  #methods=external,password,token
  #password=keystone.auth.plugins.password.Password
  #token=keystone.auth.plugins.token.Token
  #external=keystone.auth.plugins.external.DefaultDomain

  #[cache]
  # ============ Options defined in keystone
  #config_prefix=cache.keystone
  #expiration_time=600
  #backend=keystone.common.cache.noop
  #use_key_mangler=true
  #backend_argument=
  #proxies=
  #enabled=false
  #debug_cache_backend=false

  #[catalog]
  # ============ Options defined in keystone
  #template_file=default_catalog.templates
  #driver=keystone.catalog.backends.sql.Catalog
  #list_limit=<None>
	
  #[credential]
  # ============ Options defined in keystone
  #driver=keystone.credential.backends.sql.Credential
	
  # [database]
  # ============ Options defined in keystone.openstack.common.db.options
  #sqlite_db=keystone.sqlite
  #sqlite_synchronous=true
  #backend=sqlalchemy
  its(:content) { should match /connection = mysql:\/\/keystone:(.*?)@(.*?).(.*?).(.*?)\/keystone/ }     #To be updated
  #mysql_sql_mode=TRADITIONAL
  #idle_timeout=3600
  #min_pool_size=1
  #max_pool_size=<None>
  #max_retries=10
  #retry_interval=10
  #max_overflow=<None>
  #connection_debug=0
  #connection_trace=false
  #pool_timeout=<None>
  #use_db_reconnect=false
  #db_retry_interval=1
  #db_inc_retry_interval=true
  #db_max_retry_interval=10
  #db_max_retries=20
	
  # [ec2]
  # ============ Options defined in keystone
  #driver=keystone.contrib.ec2.backends.kvs.Ec2
	
  # [endpoint_filter]
  # Options defined in keystone
  #driver=keystone.contrib.endpoint_filter.backends.sql.EndpointFilter
  #return_all_endpoints_if_no_filter=true

  # [federation]
  # Options defined in keystone
  #driver=keystone.contrib.federation.backends.sql.Federation
  #assertion_prefix=
	
  # [identity]
  # Options defined in keystone
  #default_domain_id=default
  #domain_specific_drivers_enabled=false
  #domain_config_dir=/etc/keystone/domains
  #driver=keystone.identity.backends.sql.Identity
  #max_password_length=4096
  #list_limit=<None>
	
  # [kvs]
  # Options defined in keystone
  #backends=
  #config_prefix=keystone.kvs
  #enable_key_mangler=true
  #default_lock_timeout=5
	
  # [ldap]
  # Options defined in keystone
  #url=ldap://localhost
  #user=<None>
  #password=<None>
  #suffix=cn=example,cn=com
  #use_dumb_member=false
  #dumb_member=cn=dumb,dc=nonexistent
  #allow_subtree_delete=false
  #query_scope=one
  #page_size=0
  #alias_dereferencing=default
  #chase_referrals=<None>
  #user_tree_dn=<None>
  #user_filter=<None>
  #user_objectclass=inetOrgPerson
  #user_id_attribute=cn
  #user_name_attribute=sn
  #user_mail_attribute=email
  #user_pass_attribute=userPassword
  #user_enabled_attribute=enabled
  #user_enabled_mask=0
  #user_enabled_default=True
  #user_attribute_ignore=default_project_id,tenants
  #user_default_project_id_attribute=<None>
  #user_allow_create=true
  #user_allow_update=true
  #user_allow_delete=true
  #user_enabled_emulation=false
  #user_enabled_emulation_dn=<None>
  #user_additional_attribute_mapping=
  #tenant_tree_dn=<None>
  #tenant_filter=<None>
  #tenant_objectclass=groupOfNames
  #tenant_id_attribute=cn
  #tenant_member_attribute=member
  #tenant_name_attribute=ou
  #tenant_desc_attribute=description
  #tenant_enabled_attribute=enabled
  #tenant_domain_id_attribute=businessCategory
  #tenant_attribute_ignore=
  #tenant_allow_create=true
  #tenant_allow_update=true
  #tenant_allow_delete=true
  #tenant_enabled_emulation=false
  #tenant_enabled_emulation_dn=<None>
  #tenant_additional_attribute_mapping=
  #role_tree_dn=<None>
  #role_filter=<None>
  #role_objectclass=organizationalRole
  #role_id_attribute=cn
  #role_name_attribute=ou
  #role_member_attribute=roleOccupant
  #role_attribute_ignore=
  #role_allow_create=true
  #role_allow_update=true
  #role_allow_delete=true
  #role_additional_attribute_mapping=
  #group_tree_dn=<None>
  #group_filter=<None>
  #group_objectclass=groupOfNames
  #group_id_attribute=cn
  #group_name_attribute=ou
  #group_member_attribute=member
  #group_desc_attribute=description
  #group_attribute_ignore=
  #group_allow_create=true
  #group_allow_update=true
  #group_allow_delete=true
  #group_additional_attribute_mapping=
  #tls_cacertfile=<None>
  #tls_cacertdir=<None>
  #use_tls=false
  #tls_req_cert=demand
	
  # [matchmaker_ring]
  # Options defined in oslo.messaging
  #ringfile=/etc/oslo/matchmaker_ring.json
  #servers=localhost:11211
  #max_compare_and_set_retry=16
	
  # [oauth1]
  #driver=keystone.contrib.oauth1.backends.sql.OAuth1
  #request_token_duration=28800
  #access_token_duration=86400
	
  # [os_inherit]
  #enabled=false
	
  # [paste_deploy]
  #config_file=keystone-paste.ini

  # [policy]
  #driver=keystone.policy.backends.sql.Policy
  #list_limit=<None>
	
  # [revoke]
  #driver=keystone.contrib.revoke.backends.kvs.Revoke
  #expiration_buffer=1800
  #caching=true
	
  # [signing]
  #token_format=<None>
  #certfile=/etc/keystone/ssl/certs/signing_cert.pem
  #keyfile=/etc/keystone/ssl/private/signing_key.pem
  #ca_certs=/etc/keystone/ssl/certs/ca.pem
  #ca_key=/etc/keystone/ssl/private/cakey.pem
  #key_size=2048
  #valid_days=3650
  #cert_subject=/C=US/ST=Unset/L=Unset/O=Unset/CN=www.example.com
	
  # [ssl]
  #enable=false
  #certfile=/etc/keystone/ssl/certs/keystone.pem
  #keyfile=/etc/keystone/ssl/private/keystonekey.pem
  #ca_certs=/etc/keystone/ssl/certs/ca.pem
  #ca_key=/etc/keystone/ssl/private/cakey.pem
  #cert_required=false
  #key_size=1024
  #valid_days=3650
  #cert_subject=/C=US/ST=Unset/L=Unset/O=Unset/CN=localhost
	
  # [stats]
  #driver=keystone.contrib.stats.backends.kvs.Stats
	
  # [token]
  #bind=
  #enforce_token_bind=permissive
  #expiration=3600
  #provider=<None>
  #driver=keystone.token.backends.sql.Token
  #caching=true
  #revocation_cache_time=3600
  #cache_time=<None>
  #revoke_by_id=true
  # [trust]
  #enabled=true
  #driver=keystone.trust.backends.sql.Trust
	
  # ============ [extra_headers] ============ 
  its(:content) { should match /Distribution = Ubuntu/ }
end

describe file('/etc/keystone/policy.json') do
  its(:content) { should match /"admin_required": "role:admin or is_admin:1",/ }
  its(:content) { should match /"service_role": "role:service",/ }
  its(:content) { should match /"service_or_admin": "rule:admin_required or rule:service_role",/ }
  its(:content) { should match /["]owner["] : ["]user_id:%\(user_id\)s["],/ }
  its(:content) { should match /"admin_or_owner": "rule:admin_required or rule:owner",/ }

  its(:content) { should match /"default": "rule:admin_required",/ }

  its(:content) { should match /"identity:get_region": "",/ }
  its(:content) { should match /"identity:list_regions": "",/ }
  its(:content) { should match /"identity:create_region": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_region": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_region": "rule:admin_required",/ }

  its(:content) { should match /"identity:get_service": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_services": "rule:admin_required",/ }
  its(:content) { should match /"identity:create_service": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_service": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_service": "rule:admin_required",/ }

  its(:content) { should match /"identity:get_endpoint": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_endpoints": "rule:admin_required",/ }
  its(:content) { should match /"identity:create_endpoint": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_endpoint": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_endpoint": "rule:admin_required",/ }

  its(:content) { should match /"identity:get_domain": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_domains": "rule:admin_required",/ }
  its(:content) { should match /"identity:create_domain": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_domain": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_domain": "rule:admin_required",/ }

  its(:content) { should match /"identity:get_project": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_projects": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_user_projects": "rule:admin_or_owner",/ }
  its(:content) { should match /"identity:create_project": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_project": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_project": "rule:admin_required",/ }

  its(:content) { should match /"identity:get_user": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_users": "rule:admin_required",/ }
  its(:content) { should match /"identity:create_user": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_user": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_user": "rule:admin_required",/ }
  its(:content) { should match /"identity:change_password": "rule:admin_or_owner",/ }

  its(:content) { should match /"identity:get_group": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_groups": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_groups_for_user": "rule:admin_or_owner",/ }
  its(:content) { should match /"identity:create_group": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_group": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_group": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_users_in_group": "rule:admin_required",/ }
  its(:content) { should match /"identity:remove_user_from_group": "rule:admin_required",/ }
  its(:content) { should match /"identity:check_user_in_group": "rule:admin_required",/ }
  its(:content) { should match /"identity:add_user_to_group": "rule:admin_required",/ }

  its(:content) { should match /"identity:get_credential": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_credentials": "rule:admin_required",/ }
  its(:content) { should match /"identity:create_credential": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_credential": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_credential": "rule:admin_required",/ }

  its(:content) { should match /"identity:ec2_get_credential": "rule:admin_or_owner",/ }
  its(:content) { should match /"identity:ec2_list_credentials": "rule:admin_or_owner",/ }
  its(:content) { should match /"identity:ec2_create_credential": "rule:admin_or_owner",/ }
  its(:content) { should match /"identity:ec2_delete_credential": "rule:admin_required or \(rule:owner and user_id:%\(target.credential.user_id\)s\)",/ }

  its(:content) { should match /"identity:get_role": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_roles": "rule:admin_required",/ }
  its(:content) { should match /"identity:create_role": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_role": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_role": "rule:admin_required",/ }

  its(:content) { should match /"identity:check_grant": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_grants": "rule:admin_required",/ }
  its(:content) { should match /"identity:create_grant": "rule:admin_required",/ }
  its(:content) { should match /"identity:revoke_grant": "rule:admin_required",/ }

  its(:content) { should match /"identity:list_role_assignments": "rule:admin_required",/ }

  its(:content) { should match /"identity:get_policy": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_policies": "rule:admin_required",/ }
  its(:content) { should match /"identity:create_policy": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_policy": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_policy": "rule:admin_required",/ }

  its(:content) { should match /"identity:check_token": "rule:admin_required",/ }
  its(:content) { should match /"identity:validate_token": "rule:service_or_admin",/ }
  its(:content) { should match /"identity:validate_token_head": "rule:service_or_admin",/ }
  its(:content) { should match /"identity:revocation_list": "rule:service_or_admin",/ }
  its(:content) { should match /"identity:revoke_token": "rule:admin_or_owner",/ }

  its(:content) { should match /"identity:create_trust": "user_id:%\(trust.trustor_user_id\)s",/ }
  its(:content) { should match /"identity:get_trust": "rule:admin_or_owner",/ }
  its(:content) { should match /"identity:list_trusts": "",/ }
  its(:content) { should match /"identity:list_roles_for_trust": "",/ }
  its(:content) { should match /"identity:check_role_for_trust": "",/ }
  its(:content) { should match /"identity:get_role_for_trust": "",/ }
  its(:content) { should match /"identity:delete_trust": "",/ }

  its(:content) { should match /"identity:create_consumer": "rule:admin_required",/ }
  its(:content) { should match /"identity:get_consumer": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_consumers": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_consumer": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_consumer": "rule:admin_required",/ }

  its(:content) { should match /"identity:authorize_request_token": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_access_token_roles": "rule:admin_required",/ }
  its(:content) { should match /"identity:get_access_token_role": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_access_tokens": "rule:admin_required",/ }
  its(:content) { should match /"identity:get_access_token": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_access_token": "rule:admin_required",/ }

  its(:content) { should match /"identity:list_projects_for_endpoint": "rule:admin_required",/ }
  its(:content) { should match /"identity:add_endpoint_to_project": "rule:admin_required",/ }
  its(:content) { should match /"identity:check_endpoint_in_project": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_endpoints_for_project": "rule:admin_required",/ }
  its(:content) { should match /"identity:remove_endpoint_from_project": "rule:admin_required",/ }

  its(:content) { should match /"identity:create_identity_provider": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_identity_providers": "rule:admin_required",/ }
  its(:content) { should match /"identity:get_identity_providers": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_identity_provider": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_identity_provider": "rule:admin_required",/ }

  its(:content) { should match /"identity:create_protocol": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_protocol": "rule:admin_required",/ }
  its(:content) { should match /"identity:get_protocol": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_protocols": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_protocol": "rule:admin_required",/ }

  its(:content) { should match /"identity:create_mapping": "rule:admin_required",/ }
  its(:content) { should match /"identity:get_mapping": "rule:admin_required",/ }
  its(:content) { should match /"identity:list_mappings": "rule:admin_required",/ }
  its(:content) { should match /"identity:delete_mapping": "rule:admin_required",/ }
  its(:content) { should match /"identity:update_mapping": "rule:admin_required",/ }

  its(:content) { should match /"identity:list_projects_for_groups": "",/ }
  its(:content) { should match /"identity:list_domains_for_groups": "",/ }

  its(:content) { should match /"identity:list_revoke_events": ""/ }
end
