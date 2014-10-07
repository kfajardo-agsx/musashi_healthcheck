require 'spec_helper'
require 'rspec/its'

describe file('/home/deploy/.ssh/config') do
  its(:content) { should match /^Host \b(\w+)\b.\b(\w+)\b/ }
  its(:content) { should match /^User \b(\w+)\b-deploy/ }
  its(:content) { should match /^IdentityFile\s(~)\D\Dssh\Ddeployer_keys\Dpriv/ }
  its(:content) { should match /^Port 22/ }
  its(:content) { should match /^Host \b(\w+)\b.\b(\w+)\b.\b(\w+)\b/ }
  its(:content) { should match /^Hostname [0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/ }
  its(:content) { should match /^User deploy/ }
  its(:content) { should match /^IdentityFile\s(~)\D\Dssh\Ddeployer_keys\Dpriv/ }
  its(:content) { should match /^Port 22/ }
  its(:content) { should match /^Host \b(\w+)\b.\b(\w+)\b.\b(\w+)\b/ }
  its(:content) { should match /^Hostname [0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/ }
  its(:content) { should match /^User deploy/ }
  its(:content) { should match /^IdentityFile\s(~)\D\Dssh\Ddeployer_keys\Dpriv/ }
  its(:content) { should match /^Port 22/ }
  its(:content) { should match /^Host \b(\w+)\b-\b(\w+)\b.\b(\w+)\b.\b(\w+)\b/ }
  its(:content) { should match /^Hostname [0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/ }
  its(:content) { should match /^User deploy/ }
  its(:content) { should match /^IdentityFile\s(~)\D\Dssh\Ddeployer_keys\Dpriv/ }
  its(:content) { should match /^Port 22/ }
  its(:content) { should match /^Host \b(\w+)\b-\b(\w+)\b.\b(\w+)\b.\b(\w+)\b/ }
  its(:content) { should match /^Hostname [0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/ }
  its(:content) { should match /^User deploy/ }
  its(:content) { should match /^IdentityFile\s(~)\D\Dssh\Ddeployer_keys\Dpriv/ }
  its(:content) { should match /^Port 22/ }
end