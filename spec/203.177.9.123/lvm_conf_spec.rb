require 'spec_helper'
require 'rspec/its'

describe file('/etc/lvm/lvm.conf') do
  its(:content) { should match /devices/ }
  its(:content) { should match /dir = "\/dev"/ }
  its(:content) { should match /scan = (.) "\/dev" (.)/ }
  its(:content) { should match /obtain_device_list_from_udev = 1/ }
  its(:content) { should match /preferred_names = (.) (.)/ }
  its(:content) { should match /filter = (.) "a\/sda1\/", "a\/sdb\/", "r\/.[*]\/"(.)/ }
  its(:content) { should match /cache_dir = "\/run\/lvm"/ }
  its(:content) { should match /cache_file_prefix = ""/ }
  its(:content) { should match /write_cache_state = 1/ }
  its(:content) { should match /sysfs_scan = 1/ }
  its(:content) { should match /multipath_component_detection = 1/ }
  its(:content) { should match /md_component_detection = 1/ }
  its(:content) { should match /md_chunk_alignment = 1/ }
  its(:content) { should match /data_alignment_detection = 1/ }
  its(:content) { should match /data_alignment = 0/ }
  its(:content) { should match /data_alignment_offset_detection = 1/ }
  its(:content) { should match /ignore_suspended_devices = 0/ }
  its(:content) { should match /disable_after_error_count = 0/ }
  its(:content) { should match /require_restorefile_with_uuid = 1/ }
  its(:content) { should match /pv_min_size = 2048/ }
  its(:content) { should match /issue_discards = 1/ }
  its(:content) { should match /allocation/ }
  its(:content) { should match /maximise_cling = 1/ }
  its(:content) { should match /mirror_logs_require_separate_pvs = 0/ }
  its(:content) { should match /thin_pool_metadata_require_separate_pvs = 0/ }
  its(:content) { should match /log/ }
  its(:content) { should match /verbose = 0/ }
  its(:content) { should match /silent = 0/ }
  its(:content) { should match /syslog = 1/ }
  its(:content) { should match /overwrite = 0/ }
  its(:content) { should match /level = 0/ }
  its(:content) { should match /indent = 1/ }
  its(:content) { should match /command_names = 0/ }
  its(:content) { should match /prefix = "  "/ }
  its(:content) { should match /backup/ }
  its(:content) { should match /backup = 1/ }
  its(:content) { should match /backup_dir = "\/etc\/lvm\/backup"/ }
  its(:content) { should match /archive = 1/ }
  its(:content) { should match /archive_dir = "\/etc\/lvm\/archive"/ }
  its(:content) { should match /retain_min = 10/ }
  its(:content) { should match /retain_days = 30/ }
  its(:content) { should match /shell/ }
  its(:content) { should match /history_size = 100/ }
  its(:content) { should match /global/ }
  its(:content) { should match /umask = 077/ }
  its(:content) { should match /test = 0/ }
  its(:content) { should match /units = "h"/ }
  its(:content) { should match /si_unit_consistency = 1/ }
  its(:content) { should match /activation = 1/ }
  its(:content) { should match /proc = "\/proc"/ }
  its(:content) { should match /locking_type = 1/ }
  its(:content) { should match /wait_for_locks = 1/ }
  its(:content) { should match /fallback_to_clustered_locking = 1/ }
  its(:content) { should match /fallback_to_local_locking = 1/ }
  its(:content) { should match /locking_dir = "\/run\/lock\/lvm"/ }
  its(:content) { should match /prioritise_write_locks = 1/ }
  its(:content) { should match /abort_on_internal_errors = 0/ }
  its(:content) { should match /detect_internal_vg_cache_corruption = 0/ }
  its(:content) { should match /metadata_read_only = 0/ }
  its(:content) { should match /mirror_segtype_default = "mirror"/ }
  its(:content) { should match /use_lvmetad = 0/ }
  its(:content) { should match /thin_check_executable = "\/usr\/sbin\/thin_check"/ }
  its(:content) { should match /thin_check_options = [ "-q" ]/ }
  its(:content) { should match /activation/ }
  its(:content) { should match /checks = 0/ }
  its(:content) { should match /udev_sync = 1/ }
  its(:content) { should match /udev_rules = 1/ }
  its(:content) { should match /verify_udev_operations = 0/ }
  its(:content) { should match /retry_deactivation = 1/ }
  its(:content) { should match /missing_stripe_filler = "error"/ }
  its(:content) { should match /use_linear_target = 1/ }
  its(:content) { should match /reserved_stack = 64/ }
  its(:content) { should match /reserved_memory = 8192/ }
  its(:content) { should match /process_priority = -18/ }
  its(:content) { should match /mirror_region_size = 512/ }
  its(:content) { should match /readahead = "auto"/ }
  its(:content) { should match /raid_fault_policy = "warn"/ }
  its(:content) { should match /mirror_log_fault_policy = "allocate"/ }
  its(:content) { should match /mirror_image_fault_policy = "remove"/ }
  its(:content) { should match /snapshot_autoextend_threshold = 100/ }
  its(:content) { should match /snapshot_autoextend_percent = 20/ }
  its(:content) { should match /thin_pool_autoextend_threshold = 100/ }
  its(:content) { should match /thin_pool_autoextend_percent = 20/ }
  its(:content) { should match /use_mlockall = 0/ }
  its(:content) { should match /monitoring = 0/ }
  its(:content) { should match /polling_interval = 15/ }
  its(:content) { should match /dmeventd/ }
  its(:content) { should match /mirror_library = "libdevmapper-event-lvm2mirror.so"/ }
  its(:content) { should match /snapshot_library = "libdevmapper-event-lvm2snapshot.so"/ }
  its(:content) { should match /thin_library = "libdevmapper-event-lvm2thin.so"/ }
end