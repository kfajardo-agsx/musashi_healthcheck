require 'spec_helper'
require 'rspec/its'

describe file('/etc/default/grub') do
  its(:content) { should match /^GRUB_RECORDFAIL_TIMEOUT=30/ }
  its(:content) { should match /^GRUB_CMDLINE_LINUX_DEFAULT="console=tty0 console=ttyS1,115200"/ }
end