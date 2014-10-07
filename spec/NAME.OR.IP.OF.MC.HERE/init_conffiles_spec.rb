require 'spec_helper'
require 'rspec/its'

describe file('/etc/init/logstash.conf') do
  its(:content) { should match /description "Logstash container"/ }
  its(:content) { should match /author "Musashi"/ }
  its(:content) { should match /start on started docker/ }
  its(:content) { should match /stop on stopping docker/ }
  its(:content) { should match /respawn/ }
  its(:content) { should match /script/ }
  its(:content) { should match /sleep 2/ }
  its(:content) { should match /\/usr\/bin\/docker start -a logstash/ }
  its(:content) { should match /end script/ }
  its(:content) { should match /pre-stop exec \/usr\/bin\/docker stop logstash/ }
end

describe file('/etc/init/mariadb.conf') do
  its(:content) { should match /description "MariaDB container"/ }
  its(:content) { should match /author "Musashi"/ }
  its(:content) { should match /start on started docker/ }
  its(:content) { should match /stop on stopping docker/ }
  its(:content) { should match /respawn/ }
  its(:content) { should match /script/ }
  its(:content) { should match /sleep 2/ }
  its(:content) { should match /\/usr\/bin\/docker start -a mariadb/ }
  its(:content) { should match /end script/ }
  its(:content) { should match /pre-stop exec \/usr\/bin\/docker stop -t 20 mariadb/ }
end

describe file('/etc/init/webapp.conf') do
  its(:content) { should match /description "Dashboard container"/ }
  its(:content) { should match /author "Musashi"/ }
  its(:content) { should match /start on \(started riemann and started mariadb and started logstash\)/ }
  its(:content) { should match /stop on stopping docker/ }
  its(:content) { should match /respawn/ }
  its(:content) { should match /script/ }
  its(:content) { should match /sleep 2/ }
  its(:content) { should match /\/usr\/bin\/docker start -a webapp/ }
  its(:content) { should match /end script/ }
  its(:content) { should match /pre-stop exec \/usr\/bin\/docker stop webapp/ }
end

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

describe file('/etc/init/graphite.conf') do
  its(:content) { should match /description "Graphite container"/ }
  its(:content) { should match /author "Musashi"/ }
  its(:content) { should match /start on started docker/ }
  its(:content) { should match /stop on stopping docker/ }
  its(:content) { should match /kill signal QUIT/ }
  its(:content) { should match /respawn/ }
  its(:content) { should match /script/ }
  its(:content) { should match /sleep 2/ }
  its(:content) { should match /\/usr\/bin\/docker start -a graphite/ }
  its(:content) { should match /end script/ }
  its(:content) { should match /pre-stop exec \/usr\/bin\/docker kill -s QUIT graphite/ }
end
