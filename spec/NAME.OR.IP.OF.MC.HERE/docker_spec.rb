require 'spec_helper'
require 'rspec/its'

describe file('/etc/default/docker') do
  its(:content) { should match /DOCKER_OPTS="-r=false -H tcp:\/\/0.0.0.0:4243 -H unix:\/\/\/var\/run\/docker.sock"/ }
end

describe file('/etc/apt/sources.list.d/docker.list') do
  its(:content) { should match /deb http:\/\/get.docker.io\/ubuntu docker main/ }
end
