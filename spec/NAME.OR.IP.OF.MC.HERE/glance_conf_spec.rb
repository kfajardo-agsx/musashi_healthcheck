require 'spec_helper'
require 'rspec/its'

describe file('/etc/glance/glance-api.conf') do
  # ============ [DEFAULT] ============ 
  its(:content) { should match /default_store = (.*?)/ }
  its(:content) { should match /bind_host = \d+.\d+.\d+.\d+/ }     # To be updated
  its(:content) { should match /bind_port = 9292/ }
  its(:content) { should match /log_file = \/var\/log\/glance\/api.log/ }
  its(:content) { should match /backlog = 4096/ }
  its(:content) { should match /workers = 1/ }

  # ============ Registry Options ============
  its(:content) { should match /registry_host = (.*?).(.*?).(.*?)/ }    # To be updated
  its(:content) { should match /registry_port = 9191/ }
  its(:content) { should match /registry_client_protocol = http/ }

  # ============ Notification System Options ============
  its(:content) { should match /notification_driver = messaging/ }
  its(:content) { should match /rpc_backend = rabbit/ }
  its(:content) { should match /rabbit_host(.*?) = ([a-z0-9]+(.)[a-z0-9]+).[a-z0-9]+.[a-z0-9]+/ }
  its(:content) { should match /rabbit_port = 5672/ }
  its(:content) { should match /rabbit_use_ssl = false/ }
  its(:content) { should match /rabbit_userid = guest/ }
  its(:content) { should match /rabbit_password = (.*?)/ }    # To be updated
  its(:content) { should match /rabbit_virtual_host = \//}
  its(:content) { should match /rabbit_notification_exchange = glance/ }
  its(:content) { should match /rabbit_notification_topic = notifications/ }
  its(:content) { should match /rabbit_durable_queues = False/ }
  its(:content) { should match /qpid_notification_exchange = glance/ }
  its(:content) { should match /qpid_notification_topic = notifications/ }
  its(:content) { should match /qpid_hostname = localhost/ }
  its(:content) { should match /qpid_port = 5672/ }
  its(:content) { should match /qpid_username = / }
  its(:content) { should match /qpid_password = / }
  its(:content) { should match /qpid_sasl_mechanisms = / }
  its(:content) { should match /qpid_reconnect_timeout = 0/ }
  its(:content) { should match /qpid_reconnect_limit = 0/ }
  its(:content) { should match /qpid_reconnect_interval_min = 0/ }
  its(:content) { should match /qpid_reconnect_interval_max = 0/ }
  its(:content) { should match /qpid_reconnect_interval = 0/ }
  its(:content) { should match /qpid_heartbeat = 5/ }
  its(:content) { should match /qpid_protocol = tcp/ } 
  its(:content) { should match /qpid_tcp_nodelay = True/ }

  # ============ Filesystem Store Options ============
  its(:content) { should match /filesystem_store_datadir = \/var\/lib\/glance\/images\//}

  # ============ Swift Store Options ============
  its(:content) { should match /swift_store_auth_version = 2/ }
  its(:content) { should match /swift_store_auth_address = (([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]):5000\/v2.0\// }    # To be updated
  its(:content) { should match /swift_store_user = jdoe:jdoe/ }
  its(:content) { should match /swift_store_key = a86850deb2742ec3cb41518e26aa2d89/ }
  its(:content) { should match /swift_store_container = glance/ }
  its(:content) { should match /swift_store_create_container_on_put = False/ }
  its(:content) { should match /swift_store_large_object_size = 5120/ }
  its(:content) { should match /swift_store_large_object_chunk_size = 200/ }
  its(:content) { should match /swift_enable_snet = False/ }

  # ============ S3 Store Options ============
  its(:content) { should match /s3_store_host = \d+.\d+.\d+.\d+:8080\/v1.0\// }
  its(:content) { should match /s3_store_access_key = <20-char AWS access key>/ }
  its(:content) { should match /s3_store_secret_key = <40-char AWS secret key>/ }
  its(:content) { should match /s3_store_bucket = <lowercased 20-char aws access key>glance/ }
  its(:content) { should match /s3_store_create_bucket_on_put = False/ }

  # ============ Sheepdog Store Options ============
  its(:content) { should match /sheepdog_store_address = localhost/ }
  its(:content) { should match /sheepdog_store_port = 7000/ }
  its(:content) { should match /sheepdog_store_chunk_size = 64/ }

  # ============ Delayed Delete Options ============
  its(:content) { should match /delayed_delete = False/ }
  its(:content) { should match /scrub_time = 43200/ }
  its(:content) { should match /scrubber_datadir = \/var\/lib\/glance\/scrubber/ }
	
  # ============ Image Cache Options ============
  its(:content) { should match /image_cache_dir = \/var\/lib\/glance\/image-cache\// }

  # ============ RBD Store Options ============
  its(:content) { should match /rbd_store_ceph_conf = \/etc\/ceph\/ceph.conf/ }
  its(:content) { should match /rbd_store_user = glance/ }
  its(:content) { should match /rbd_store_pool = (.*?)/ }
  #its(:content) { should match /show_image_direct_url = True/ }

  # ============ Database Options ============
  its(:content) { should match /connection = mysql:\/\/glance:(.*?)@(.*?).(.*?).(.*?)\/glance/ }
  its(:content) { should match /backend = sqlalchemy/ }

  # ============ [keystone_authtoken] ============
  its(:content) { should match /auth_uri = http:\/\/(.*?).(.*?).(.*?):5000/ }     # To be updated
  its(:content) { should match /auth_host = (.*?).(.*?).(.*?)/ }     # To be updated
  its(:content) { should match /auth_port = 35357/ }
  its(:content) { should match /auth_protocol = http/ }
  its(:content) { should match /admin_tenant_name = service/ }
  its(:content) { should match /admin_user = glance/ }
  its(:content) { should match /admin_password = (.*?)/ }     # To be updated

  # ============ [paste_deploy] ============
  its(:content) { should match /flavor = keystone/ }

  # ============ [store_type_location_strategy] ============
  #store_type_preference =
end

describe file('/etc/glance/glance-registry.conf') do
  # ============ [DEFAULT] ============
  its(:content) { should match /bind_host = \d+.\d+.\d+.\d+/ }
  its(:content) { should match /bind_port = 9191/ }
  its(:content) { should match /log_file = \/var\/log\/glance\/registry.log/ }
  its(:content) { should match /backlog = 4096/ }
  its(:content) { should match /api_limit_max = 1000/ }
  its(:content) { should match /limit_param_default = 25/ }

  # ============ Database Options ============
  its(:content) { should match /connection = mysql:\/\/glance:(.*?)@(.*?).(.*?).(.*?)\/glance/ }     # To be updated
  its(:content) { should match /backend = sqlalchemy/ }

  # ============ [keystone_authtoken] ============
  its(:content) { should match /auth_uri = http:\/\/(.*?).(.*?).(.*?):5000/ }     # To be updated
  its(:content) { should match /auth_host = (.*?).(.*?).(.*?)/ }     # To be updated
  its(:content) { should match /auth_port = 35357/ } 
  its(:content) { should match /auth_protocol = http/ }
  its(:content) { should match /admin_tenant_name = service/ }
  its(:content) { should match /admin_user = glance/ }
  its(:content) { should match /admin_password = (.*?)/ }     # To be updated

  # ============ [paste_deploy] ============
  its(:content) { should match /flavor = keystone/ }
end
