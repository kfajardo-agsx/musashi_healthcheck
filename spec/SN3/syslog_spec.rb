require 'spec_helper'
require 'rspec/its'

describe file('/etc/init/irqbalance.conf') do
  its(:content) { should match /^exec\s+\/usr\/sbin\/irqbalance\s+[$]OPTIONS\s+[$]DOPTIONS/ }
end

describe file('/etc/default/irqbalance') do
  its(:content) { should match /^ENABLED="1"/ }
  its(:content) { should match /^OPTIONS="--hintpolicy=ignore"/ }
end
