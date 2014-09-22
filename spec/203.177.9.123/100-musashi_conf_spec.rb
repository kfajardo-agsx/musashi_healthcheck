require 'spec_helper'
require 'rspec/its'

describe file('/etc/rsyslog.d/100-musashi.conf') do
	its(:content) { should match /^auth,authpriv.*                 \/var\/log\/auth.log/ }
  its(:content) { should match /^[*].[*];auth,authpriv.none\s+-\/var\/log\/syslog/ }
  #cron.*                         /var/log/cron.log
  #daemon.*                       -/var/log/daemon.log
  its(:content) { should match /^kern.[*]\s+-\/var\/log\/kern.log/ }
  #lpr.*                          -/var/log/lpr.log
  its(:content) { should match /^mail.[*]\s+-\/var\/log\/mail.log/ }
  #user.*                         -/var/log/user.log
	#mail.info                      -/var/log/mail.info
  #mail.warn                      -/var/log/mail.warn
  its(:content) { should match /^mail.err\s+\/var\/log\/mail.err/ }
  its(:content) { should match /^news.crit\s+\/var\/log\/news\/news.crit/ }
  its(:content) { should match /^news.err\s+\/var\/log\/news\/news.err/ }
  its(:content) { should match /^news.notice\s+-\/var\/log\/news\/news.notice/ }
	#*.=debug;\
  #       auth,authpriv.none;\
  #       news.none;mail.none     -/var/log/debug
  #*.=info;*.=notice;*.=warn;\
  #       auth,authpriv.none;\
  #       cron,daemon.none;\
  #       mail,news.none          -/var/log/messages
  its(:content) { should match /^[*].emerg\s+:omusrmsg:[*]/ }
	#daemon,mail.*;\
  #       news.=crit;news.=err;news.=notice;\
  #       *.=debug;*.=info;\
  #       *.=notice;*.=warn       /dev/tty8
  its(:content) { should match /daemon.[*];mail.[*];\\/ }
  its(:content) { should match /news.err;\\/ }
  its(:content) { should match /[*].=debug;[*].=info;\\/ }
  its(:content) { should match /[*].=notice;[*].=warn\s+\|\/dev\/xconsole/ }
  its(:content) { should match /^[*].[*] @(.*?)-mc.(.*?).(.*?):514/ }
end