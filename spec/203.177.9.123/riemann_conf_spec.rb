require 'spec_helper'
require 'rspec/its'

describe file('/etc/init/riemann.conf') do
  its(:content) { should match /description "Riemann container"/ }
  its(:content) { should match /author "Musashi"/ }

  its(:content) { should match /start on started graphite/ }
  its(:content) { should match /stop on stopping docker/ }

  its(:content) { should match /respawn/ }
  its(:content) { should match /script/ }
  its(:content) { should match /sleep 2/  }
  its(:content) { should match /\/usr\/bin\/docker start -a riemann/ }
  its(:content) { should match /end script/ }

  its(:content) { should match /pre-stop exec \/usr\/bin\/docker stop riemann/ }
end
