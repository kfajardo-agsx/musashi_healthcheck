require 'spec_helper'
require 'rspec/its'

describe file('/etc/init/irqbalance.conf') do
  its(:content) { should match /^exec \/usr\/sbin\/irqbalance $OPTIONS $DOPTIONS/ }
end

describe file('/etc/default/irqbalance') do
  its(:content) { should match /^ENABLED="1"/ }
  its(:content) { should match /^ONESHOT="0"/ }
  its(:content) { should match /^OPTIONS="--hintpolicy=ignore"/ }
end
