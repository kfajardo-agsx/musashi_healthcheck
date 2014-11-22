require 'spec_helper'
require 'rspec/its'

describe file('/etc/default/kdump-tools') do
  its(:content) { should match /^USE_KDUMP=1/ }
  its(:content) { should match /^KDUMP_SYSCTL="kernel.panic_on_oops=1 kernel.panic_on_unrecovered_nmi=1"/ }
  its(:content) { should match /^KDUMP_COREDIR="\/var\/crash"/ }
  its(:content) { should match /^MAKEDUMP_ARGS="-c -d 31"/ }
  its(:content) { should match /^KDUMP_CMDLINE_APPEND="1 irqpoll maxcpus=1"/ }
end

describe file('/etc/default/grub.d/kexec-tools.cfg') do
  its(:content) { should match /GRUB[_]CMDLINE[_]LINUX[_]DEFAULT[=]["][$]GRUB_CMDLINE[_]LINUX[_]DEFAULT\s+crashkernel[=]4G[-][:]512M["]/ }
end


