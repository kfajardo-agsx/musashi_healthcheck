require 'spec_helper'
require 'rspec/its'

describe file('/root/.my.cnf') do
# ========== [client] ==========
  its(:content) { should match /user=root/ }
end