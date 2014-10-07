require 'spec_helper'
require 'rspec/its'

describe file('/etc/cinder/cinder.conf') do
  #its(:content) { should match osapi_volume_listen = 172.17.0.3 }
  its(:content) { should match /rootwrap_config = \/etc\/cinder\/rootwrap.conf/ }
  its(:content) { should match /api_paste_confg = \/etc\/cinder\/api-paste.ini/ }
  its(:content) { should match /iscsi_helper = tgtadm/ }
  its(:content) { should match /volume_name_template = volume-%s/ }
  its(:content) { should match /volume_group = cinder-volumes/ }
  its(:content) { should match /verbose = True/ }
  its(:content) { should match /auth_strategy = keystone/ }
  its(:content) { should match /state_path = \/var\/lib\/cinder/ }
  its(:content) { should match /lock_path = \/var\/lock\/cinder/ }
  its(:content) { should match /volumes_dir = \/var\/lib\/cinder\/volumes/ }
  its(:content) { should match /rpc_backend = cinder.openstack.common.rpc.impl_kombu/ }
  its(:content) { should match /rabbit_host = (\w+)\W(\w+).(\w+).(\w+)/ }
  its(:content) { should match /rabbit_port = 5672/ }
  its(:content) { should match /rabbit_userid = guest/ }
  its(:content) { should match /rabbit_password = (.*?)/ }     # To be updated
  its(:content) { should match /control_exchange = cinder/ }
  its(:content) { should match /notification_driver = cinder.openstack.common.notifier.rpc_notifier/ }
  #its(:content) { should match volume_driver = cinder.volume.drivers.rbd.RBDDriver }
  #its(:content) { should match rbd_pool = volumes1 }
  #its(:content) { should match rbd_ceph_conf = /etc/ceph/ceph.conf }
  #its(:content) { should match rbd_flatten_volume_from_snapshot = False }
  #its(:content) { should match rbd_max_clone_depth = 5 }
  #its(:content) { should match glance_host = controller.musashi.ph }
  #its(:content) { should matchrbd_user = cinder }
  #its(:content) { should match rbd_secret_uuid = 67d37c0f-a8d6-4522-b4fb-d511ce7ae21c }

  # ============ [database] ============
  its(:content) { should match /connection = mysql:\/\/cinder:(.*?)@(.*?).mc.(.*?).(.*?)\/cinder/ }

  # ============ [keystone_authtoken] ============
  its(:content) { should match /auth_uri = http:\/\/(.*?).(.*?).(.*?):5000/ }     # To be updated
  its(:content) { should match /auth_host = (.*?).(.*?).(.*?)/ }     # To be updated
  its(:content) { should match /auth_port = 35357/ }
  its(:content) { should match /auth_protocol = http/ }
  its(:content) { should match /admin_tenant_name = service/ }
  its(:content) { should match /admin_user = cinder/ }
  its(:content) { should match /admin_password = (.*?)/ }     # To be updated
end
