require 'spec_helper'
require 'rspec/its'

describe file('/etc/nova/nova.conf') do
  # ============ [DEFAULT] ============ 
  its(:content) { should match /scheduler_default_filters = RetryFilter,AvailabilityZoneFilter,RamFilter,CoreFilter,ComputeFilter,ComputeCapabilitiesFilter,ImagePropertiesFilter,DifferentHostFilter,SameHostFilter/ }
  its(:content) { should match /cpu_allocation_ratio = \d+[.]\d+/ }     # To be updated
  its(:content) { should match /quota_instances = \d+/ }     # To be updated
  its(:content) { should match /quota_security_group_rules = \d+/ }     # To be updated
  its(:content) { should match /quota_security_groups = \d+/ }     # To be updated
  its(:content) { should match /quota_floating_ips = \d+/ }     # To be updated
  its(:content) { should match /quota_key_pairs = \d+/ }     # To be updated
  its(:content) { should match /quota_cores = \d+/ }     # To be updated
  its(:content) { should match /quota_volumes = \d+/ }     # To be updated
  its(:content) { should match /quota_ram = \d+/ }     # To be updated

  #its(:content) { should match osapi_compute_listen=172.17.0.3 }
  #its(:content) { should match ec2_listen=172.17.0.3           }
  #its(:content) { should match metadata_listen=172.17.0.3      }
  #its(:content) { should match novncproxy_host=172.17.0.3      }
  #its(:content) { should match novncproxy_port=6080            }
	
  its(:content) { should match /dhcpbridge_flagfile = \/etc\/nova\/nova.conf/ }
  its(:content) { should match /dhcpbridge = \/usr\/bin\/nova-dhcpbridge/ }
  its(:content) { should match /logdir = \/var\/log\/nova/ }
  its(:content) { should match /state_path = \/var\/lib\/nova/ }
  its(:content) { should match /lock_path = \/var\/lock\/nova/ }
  its(:content) { should match /force_dhcp_release = True/ }
  its(:content) { should match /iscsi_helper = tgtadm/ }
  its(:content) { should match /libvirt_use_virtio_for_bridges = True/ }
  its(:content) { should match /connection_type = libvirt/ }
  its(:content) { should match /root_helper = sudo nova-rootwrap \/etc\/nova\/rootwrap.conf/ }
  its(:content) { should match /verbose = True/ }
  its(:content) { should match /ec2_private_dns_show_ip = True/ }
  its(:content) { should match /api_paste_config = \/etc\/nova\/api-paste.ini/ }
  its(:content) { should match /volumes_path = \/var\/lib\/nova\/volumes/ }
  its(:content) { should match /enabled_apis = ec2,osapi_compute,metadata/ }
  its(:content) { should match /rpc_backend = rabbit/ }
  its(:content) { should match /rabbit_host = (([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])/ }     #To be updated
  its(:content) { should match /rabbit_password = (.*?)/ }     #To be updated
  its(:content) { should match /my_ip = (([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])/ }     #To be updated
  its(:content) { should match /vncserver_listen = (([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])/ }     #To be updated
  its(:content) { should match /vncserver_proxyclient_address = (([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])/ }     #To be updated
  its(:content) { should match /auth_strategy = keystone/ }
  its(:content) { should match /network_api_class = nova.network.api.API/ }
  its(:content) { should match /security_group_api = nova/ }
  its(:content) { should match /network_manager = nova.network.manager.\w+/ }
  #its(:content) { should match flat_network_bridge = br100 }
  #its(:content) { should match flat_interface = bond0 }

  # ============ [database] ============
  its(:content) { should match /connection = mysql:\/\/nova:\w+@(.*?).\w+.\w+\/nova/ }     #To be updated

  # ============ [keystone_authtoken] ============
  its(:content) { should match /auth_uri = http:\/\/(.*?).(.*?).(.*?):5000/ }     #To be updated
  its(:content) { should match /auth_host = (.*?).(.*?).(.*?)/ }     #To be updated
  its(:content) { should match /auth_port = 35357/ }
  its(:content) { should match /auth_protocol = http/ }
  its(:content) { should match /admin_tenant_name = service/ }
  its(:content) { should match /admin_user = nova/ }
  its(:content) { should match /admin_password = (.*?)/ }     #To be updated

  # ============ [osapi_v3] ============
  its(:content) { should match /enabled = True/ }
end

describe file('/etc/nova/policy.json') do
  its(:content) { should match /"context_is_admin":  "role:admin",/ }
  its(:content) { should match /"admin_or_owner":  "is_admin:True or project_id:%\(project_id\)s",/ }
  its(:content) { should match /"default": "rule:admin_or_owner",/ }
  its(:content) { should match /"cells_scheduler_filter:TargetCellFilter": "is_admin:True",/ }
  its(:content) { should match /"compute:create": "",/ }
  its(:content) { should match /"compute:create:attach_network": "",/ }
  its(:content) { should match /"compute:create:attach_volume": "",/ }
  its(:content) { should match /"compute:create:forced_host": "is_admin:True",/ }
  its(:content) { should match /"compute:get_all": "",/ }
  its(:content) { should match /"compute:get_all_tenants": "",/ }
  its(:content) { should match /"compute:unlock_override": "rule:admin_api",/ }
  its(:content) { should match /"compute:shelve": "",/ }
  its(:content) { should match /"compute:shelve_offload": "",/ }
  its(:content) { should match /"compute:unshelve": "",/ }
  its(:content) { should match /"compute:volume_snapshot_create": "",/ }
  its(:content) { should match /"compute:volume_snapshot_delete": "",/ }
  its(:content) { should match /"admin_api": "is_admin:True",/ }
  its(:content) { should match /"compute_extension:accounts": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:admin_actions": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:admin_actions:pause": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:admin_actions:unpause": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:admin_actions:suspend": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:admin_actions:resume": "rule:admin_or_owner",/ } 
  its(:content) { should match /"compute_extension:admin_actions:lock": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:admin_actions:unlock": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:admin_actions:resetNetwork": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:admin_actions:injectNetworkInfo": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:admin_actions:createBackup": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:admin_actions:migrateLive": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:admin_actions:resetState": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:admin_actions:migrate": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:pause": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:unpause": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:suspend": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:resume": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:lock": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:unlock": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:reset_network": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:inject_network_info": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:create_backup": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:migrate_live": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:reset_state": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-actions:migrate": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-password": "",/ }
  its(:content) { should match /"compute_extension:v3:os-admin-password:discoverable": "",/ }
  its(:content) { should match /"compute_extension:aggregates": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-aggregates": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-aggregates:discoverable": "",/ }
  its(:content) { should match /"compute_extension:agents": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-agents": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-agents:discoverable": "",/ }
  its(:content) { should match /"compute_extension:attach_interfaces": "",/ }
  its(:content) { should match /"compute_extension:v3:os-attach-interfaces": "",/ }
  its(:content) { should match /"compute_extension:v3:os-attach-interfaces:discoverable": "",/ }
  its(:content) { should match /"compute_extension:baremetal_nodes": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:cells": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-cells": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-cells:discoverable": "",/ }
  its(:content) { should match /"compute_extension:certificates": "",/ }
  its(:content) { should match /"compute_extension:v3:os-certificates": "",/ }
  its(:content) { should match /"compute_extension:v3:os-certificates:discoverable": "",/ }
  its(:content) { should match /"compute_extension:cloudpipe": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:cloudpipe_update": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:console_output": "",/ }
  its(:content) { should match /"compute_extension:v3:consoles:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:console-output:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:console-output": "",/ }
  its(:content) { should match /"compute_extension:consoles": "",/ }
  its(:content) { should match /"compute_extension:v3:os-remote-consoles": "",/ }
  its(:content) { should match /"compute_extension:v3:os-remote-consoles:discoverable": "",/ }
  its(:content) { should match /"compute_extension:coverage_ext": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-coverage": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-coverage:discoverable": "",/ }
  its(:content) { should match /"compute_extension:createserverext": "",/ }
  its(:content) { should match /"compute_extension:deferred_delete": "",/ }
  its(:content) { should match /"compute_extension:v3:os-deferred-delete": "",/ }
  its(:content) { should match /"compute_extension:v3:os-deferred-delete:discoverable": "",/ }
  its(:content) { should match /"compute_extension:disk_config": "",/ }
  its(:content) { should match /"compute_extension:v3:os-disk-config": "",/ }
  its(:content) { should match /"compute_extension:evacuate": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-evacuate": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-evacuate:discoverable": "",/ }
  its(:content) { should match /"compute_extension:extended_server_attributes": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-extended-server-attributes": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-extended-server-attributes:discoverable": "",/ }
  its(:content) { should match /"compute_extension:extended_status": "",/ }
  its(:content) { should match /"compute_extension:v3:os-extended-status": "",/ }
  its(:content) { should match /"compute_extension:v3:os-extended-status:discoverable": "",/ }
  its(:content) { should match /"compute_extension:extended_availability_zone": "",/ }
  its(:content) { should match /"compute_extension:v3:os-extended-availability-zone": "",/ }
  its(:content) { should match /"compute_extension:v3:os-extended-availability-zone:discoverable": "",/ }
  its(:content) { should match /"compute_extension:extended_ips": "",/ }
  its(:content) { should match /"compute_extension:extended_ips_mac": "",/ }
  its(:content) { should match /"compute_extension:extended_vif_net": "",/ }
  its(:content) { should match /"compute_extension:v3:extension_info:discoverable": "",/ }
  its(:content) { should match /"compute_extension:extended_volumes": "",/ }
  its(:content) { should match /"compute_extension:v3:os-extended-volumes": "",/ }
  its(:content) { should match /"compute_extension:v3:os-extended-volumes:swap": "",/ }
  its(:content) { should match /"compute_extension:v3:os-extended-volumes:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:os-extended-volumes:attach": "",/ }
  its(:content) { should match /"compute_extension:v3:os-extended-volumes:detach": "",/ }
  its(:content) { should match /"compute_extension:fixed_ips": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:flavor_access": "",/ }
  its(:content) { should match /"compute_extension:v3:os-flavor-access": "",/ }
  its(:content) { should match /"compute_extension:v3:os-flavor-access:discoverable": "",/ }
  its(:content) { should match /"compute_extension:flavor_disabled": "",/ }
  its(:content) { should match /"compute_extension:v3:os-flavor-disabled": "",/ }
  its(:content) { should match /"compute_extension:v3:os-flavor-disabled:discoverable": "",/ }
  its(:content) { should match /"compute_extension:flavor_rxtx": "",/ }
  its(:content) { should match /"compute_extension:v3:os-flavor-rxtx": "",/ }
  its(:content) { should match /"compute_extension:v3:os-flavor-rxtx:discoverable": "",/ }
  its(:content) { should match /"compute_extension:flavor_swap": "",/ }
  its(:content) { should match /"compute_extension:flavorextradata": "",/ }
  its(:content) { should match /"compute_extension:flavorextraspecs:index": "",/ }
  its(:content) { should match /"compute_extension:flavorextraspecs:show": "",/ }
  its(:content) { should match /"compute_extension:flavorextraspecs:create": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:flavorextraspecs:update": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:flavorextraspecs:delete": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:flavors:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:flavor-extra-specs:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:flavor-extra-specs:index": "",/ }
  its(:content) { should match /"compute_extension:v3:flavor-extra-specs:show": "",/ }
  its(:content) { should match /"compute_extension:v3:flavor-extra-specs:create": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:flavor-extra-specs:update": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:flavor-extra-specs:delete": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:flavormanage": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:flavor-manage": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:floating_ip_dns": "",/ }
  its(:content) { should match /"compute_extension:floating_ip_pools": "",/ }
  its(:content) { should match /"compute_extension:floating_ips": "",/ }
  its(:content) { should match /"compute_extension:floating_ips_bulk": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:fping": "",/ }
  its(:content) { should match /"compute_extension:fping:all_tenants": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:hide_server_addresses": "is_admin:False",/ }
  its(:content) { should match /"compute_extension:v3:os-hide-server-addresses": "is_admin:False",/ }
  its(:content) { should match /"compute_extension:v3:os-hide-server-addresses:discoverable": "",/ }
  its(:content) { should match /"compute_extension:hosts": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-hosts": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-hosts:discoverable": "",/ }
  its(:content) { should match /"compute_extension:hypervisors": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-hypervisors": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-hypervisors:discoverable": "",/ }
  its(:content) { should match /"compute_extension:image_size": "",/ }
  its(:content) { should match /"compute_extension:instance_actions": "",/ }
  its(:content) { should match /"compute_extension:v3:os-instance-actions": "",/ }
  its(:content) { should match /"compute_extension:v3:os-instance-actions:discoverable": "",/ }
  its(:content) { should match /"compute_extension:instance_actions:events": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-instance-actions:events": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:instance_usage_audit_log": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-instance-usage-audit-log": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:ips:discoverable": "",/ }
  its(:content) { should match /"compute_extension:keypairs": "",/ }
  its(:content) { should match /"compute_extension:keypairs:index": "",/ }
  its(:content) { should match /"compute_extension:keypairs:show": "",/ }
  its(:content) { should match /"compute_extension:keypairs:create": "",/ }
  its(:content) { should match /"compute_extension:keypairs:delete": "",/ }
  its(:content) { should match /"compute_extension:v3:keypairs:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:keypairs": "",/ }
  its(:content) { should match /"compute_extension:v3:keypairs:index": "",/ }
  its(:content) { should match /"compute_extension:v3:keypairs:show": "",/ }
  its(:content) { should match /"compute_extension:v3:keypairs:create": "",/ }
  its(:content) { should match /"compute_extension:v3:keypairs:delete": "",/ }
  its(:content) { should match /"compute_extension:v3:limits:discoverable": "",/ }
  its(:content) { should match /"compute_extension:multinic": "",/ }
  its(:content) { should match /"compute_extension:v3:os-multinic": "",/ }
  its(:content) { should match /"compute_extension:v3:os-multinic:discoverable": "",/ }
  its(:content) { should match /"compute_extension:networks": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:networks:view": "",/ }
  its(:content) { should match /"compute_extension:networks_associate": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:quotas:show": "",/ }
  its(:content) { should match /"compute_extension:quotas:update": "rule:admin_api",/ } 
  its(:content) { should match /"compute_extension:quotas:delete": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-quota-sets:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:os-quota-sets:show": "",/ }
  its(:content) { should match /"compute_extension:v3:os-quota-sets:update": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-quota-sets:delete": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-quota-sets:detail": "",/ }
  its(:content) { should match /"compute_extension:quota_classes": "",/ }
  its(:content) { should match /"compute_extension:v3:os-quota-class-sets": "",/ }
  its(:content) { should match /"compute_extension:v3:os-quota-class-sets:discoverable": "",/ }
  its(:content) { should match /"compute_extension:rescue": "",/ }
  its(:content) { should match /"compute_extension:v3:os-rescue": "",/ }
  its(:content) { should match /"compute_extension:v3:os-rescue:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:os-scheduler-hints:discoverable": "",/ }
  its(:content) { should match /"compute_extension:security_group_default_rules": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:security_groups": "",/ }
  its(:content) { should match /"compute_extension:v3:os-security-groups": "",/ }
  its(:content) { should match /"compute_extension:v3:os-security-groups:discoverable": "",/ }
  its(:content) { should match /"compute_extension:server_diagnostics": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-server-diagnostics": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-server-diagnostics:discoverable": "",/ }
  its(:content) { should match /"compute_extension:server_password": "",/ }
  its(:content) { should match /"compute_extension:v3:os-server-password": "",/ }
  its(:content) { should match /"compute_extension:v3:os-server-password:discoverable": "",/ }
  its(:content) { should match /"compute_extension:server_usage": "",/ }
  its(:content) { should match /"compute_extension:v3:os-server-usage": "",/ }
  its(:content) { should match /"compute_extension:v3:os-server-usage:discoverable": "",/ }
  its(:content) { should match /"compute_extension:services": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-services": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-services:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:server-metadata:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:servers:discoverable": "",/ }
  its(:content) { should match /"compute_extension:shelve": "",/ }
  its(:content) { should match /"compute_extension:shelveOffload": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-shelve:shelve": "",/ }
  its(:content) { should match /"compute_extension:v3:os-shelve:shelve:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:os-shelve:shelve_offload": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:simple_tenant_usage:show": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:v3:os-simple-tenant-usage:show": "rule:admin_or_owner",/ }
  its(:content) { should match /"compute_extension:v3:os-simple-tenant-usage:discoverable": "",/ }
  its(:content) { should match /"compute_extension:simple_tenant_usage:list": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-simple-tenant-usage:list": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:unshelve": "",/ }
  its(:content) { should match /"compute_extension:v3:os-shelve:unshelve": "",/ }
  its(:content) { should match /"compute_extension:users": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:virtual_interfaces": "",/ }
  its(:content) { should match /"compute_extension:virtual_storage_arrays": "",/ }
  its(:content) { should match /"compute_extension:volumes": "",/ }
  its(:content) { should match /"compute_extension:volume_attachments:index": "",/ }
  its(:content) { should match /"compute_extension:volume_attachments:show": "",/ } 
  its(:content) { should match /"compute_extension:volume_attachments:create": "",/ }
  its(:content) { should match /"compute_extension:volume_attachments:update": "",/ }
  its(:content) { should match /"compute_extension:volume_attachments:delete": "",/ }
  its(:content) { should match /"compute_extension:volumetypes": "",/ }
  its(:content) { should match /"compute_extension:availability_zone:list": "",/ }
  its(:content) { should match /"compute_extension:v3:os-availability-zone:list": "",/ }
  its(:content) { should match /"compute_extension:v3:os-availability-zone:discoverable": "",/ }
  its(:content) { should match /"compute_extension:availability_zone:detail": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-availability-zone:detail": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:used_limits_for_admin": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-used-limits": "",/ }
  its(:content) { should match /"compute_extension:v3:os-used-limits:discoverable": "",/ }
  its(:content) { should match /"compute_extension:v3:os-used-limits:tenant": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:migrations:index": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-migrations:index": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:v3:os-migrations:discoverable": "",/ }
  its(:content) { should match /"compute_extension:os-assisted-volume-snapshots:create": "rule:admin_api",/ }
  its(:content) { should match /"compute_extension:os-assisted-volume-snapshots:delete": "rule:admin_api",/ }

  its(:content) { should match /"volume:create": "",/ }
  its(:content) { should match /"volume:get_all": "",/ }
  its(:content) { should match /"volume:get_volume_metadata": "",/ }
  its(:content) { should match /"volume:get_snapshot": "",/ }
  its(:content) { should match /"volume:get_all_snapshots": "",/ }

  its(:content) { should match /"volume_extension:types_manage": "rule:admin_api",/ }
  its(:content) { should match /"volume_extension:types_extra_specs": "rule:admin_api",/ }
  its(:content) { should match /"volume_extension:volume_admin_actions:reset_status": "rule:admin_api",/ }
  its(:content) { should match /"volume_extension:snapshot_admin_actions:reset_status": "rule:admin_api",/ }
  its(:content) { should match /"volume_extension:volume_admin_actions:force_delete": "rule:admin_api",/ }

  its(:content) { should match /"network:get_all": "",/ }
  its(:content) { should match /"network:get": "",/ }
  its(:content) { should match /"network:create": "",/ }
  its(:content) { should match /"network:delete": "",/ }
  its(:content) { should match /"network:associate": "",/ }
  its(:content) { should match /"network:disassociate": "",/ }
  its(:content) { should match /"network:get_vifs_by_instance": "",/ }
  its(:content) { should match /"network:allocate_for_instance": "",/ }
  its(:content) { should match /"network:deallocate_for_instance": "",/ }
  its(:content) { should match /"network:validate_networks": "",/ }
  its(:content) { should match /"network:get_instance_uuids_by_ip_filter": "",/ }
  its(:content) { should match /"network:get_instance_id_by_floating_address": "",/ }
  its(:content) { should match /"network:setup_networks_on_host": "",/ }
  its(:content) { should match /"network:get_backdoor_port": "",/ }

  its(:content) { should match /"network:get_floating_ip": "",/ }
  its(:content) { should match /"network:get_floating_ip_pools": "",/ }
  its(:content) { should match /"network:get_floating_ip_by_address": "",/ }
  its(:content) { should match /"network:get_floating_ips_by_project": "",/ }
  its(:content) { should match /"network:get_floating_ips_by_fixed_address": "",/ }
  its(:content) { should match /"network:allocate_floating_ip": "",/ }
  its(:content) { should match /"network:deallocate_floating_ip": "",/ }
  its(:content) { should match /"network:associate_floating_ip": "",/ }
  its(:content) { should match /"network:disassociate_floating_ip": "",/ }
  its(:content) { should match /"network:release_floating_ip": "",/ }
  its(:content) { should match /"network:migrate_instance_start": "",/ }
  its(:content) { should match /"network:migrate_instance_finish": "",/ }

  its(:content) { should match /"network:get_fixed_ip": "",/ }
  its(:content) { should match /"network:get_fixed_ip_by_address": "",/ }
  its(:content) { should match /"network:add_fixed_ip_to_instance": "",/ }
  its(:content) { should match /"network:remove_fixed_ip_from_instance": "",/ }
  its(:content) { should match /"network:add_network_to_project": "",/ }
  its(:content) { should match /"network:get_instance_nw_info": "",/ }

  its(:content) { should match /"network:get_dns_domains": "",/ }
  its(:content) { should match /"network:add_dns_entry": "",/ }
  its(:content) { should match /"network:modify_dns_entry": "",/ }
  its(:content) { should match /"network:delete_dns_entry": "",/ }
  its(:content) { should match /"network:get_dns_entries_by_address": "",/ }
  its(:content) { should match /"network:get_dns_entries_by_name": "",/ }
  its(:content) { should match /"network:create_private_dns_domain": "",/ }
  its(:content) { should match /"network:create_public_dns_domain": "",/ }
  its(:content) { should match /"network:delete_dns_domain": ""/ }
end
