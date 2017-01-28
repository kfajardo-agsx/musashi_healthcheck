require 'spec_helper'
require 'rspec/its'

describe file('/etc/apache2/sites-available/dashboard.conf') do
# Ansible managed
  its(:content) { should match /<VirtualHost [*]:443>/ }
  its(:content) { should match /DocumentRoot \/var\/www\/empty/ }
  its(:content) { should match /ServerName (.*?).(.*?)/ }

  its(:content) { should match /RewriteEngine On/ }
  its(:content) { should match /RewriteCond %{DOCUMENT_ROOT}\/%{REQUEST_FILENAME} !-f/ }
  its(:content) { should match /RewriteRule (.)\/\(.[*]\)[$] balancer:\/\/frontend%{REQUEST_URI} (.)P,QSA,L(.)/ }

  its(:content) { should match /SSLEngine on/ }
  its(:content) { should match /SSLOptions (.)StrictRequire/ }
  its(:content) { should match /SSLCertificateFile \/etc\/apache2\/certs\/(.*?).(.*?).crt/ }
  its(:content) { should match /SSLCertificateKeyFile \/etc\/apache2\/certs\/(.*?).(.*?).key/ }
  its(:content) { should match /<\/VirtualHost>/ }

  its(:content) { should match /<Proxy balancer:\/\/frontend>/ }
  its(:content) { should match /RequestHeader set X_FORWARDED_PROTO 'https'/ }
  its(:content) { should match /BalancerMember http:\/\/\d+.\d+.\d+.\d+:81/ }
  its(:content) { should match /<\/Proxy>/ }
end
