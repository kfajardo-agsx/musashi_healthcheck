require 'spec_helper'
require 'rspec/its'

describe file('/etc/diamond/diamond.conf') do
  its(:content) { should match /handlers = diamond.handler.riemann.RiemannHandler, diamond.handler.archive.ArchiveHandler/ }
  its(:content) { should match /pid_file = \/var\/run\/diamond.pid/ }
  its(:content) { should match /collectors_path = \/usr\/share\/diamond\/collectors\// }
  its(:content) { should match /collectors_config_path = \/etc\/diamond\/collectors\// }
  its(:content) { should match /andlers_config_path = \/etc\/diamond\/handlers\// }
  its(:content) { should match /handlers_path = \/usr\/share\/diamond\/handlers\// }
  its(:content) { should match /collectors_reload_interval = 3600/ }
  its(:content) { should match /keys = rotated_file/ }
  its(:content) { should match /host = (.*?)-mc.(.*?).(.*?)/ }    # To be updated
  its(:content) { should match /port= 5555/ }
  its(:content) { should match /transport = udp/ }
  its(:content) { should match /log_file = \/var\/log\/diamond\/archive.log/ }
  its(:content) { should match /days = 7/ }
  its(:content) { should match /hostname\s+=\s+\d+.\d+.\d+.\d+/ }
  its(:content) { should match /port        = 3306/ }
  its(:content) { should match /username    = root/ }
  its(:content) { should match /password    =\s+/ }
  its(:content) { should match /database    = diamond/ }
  its(:content) { should match /table       = metrics/ }
  its(:content) { should match /col_time    = timestamp/ }
  its(:content) { should match /col_metric  = metric/ }
  its(:content) { should match /col_value   = value/ }
  its(:content) { should match /host = \d+.\d+.\d+.\d+/ }
  its(:content) { should match /port = 8125/ }
  its(:content) { should match /host = \d+.\d+.\d+.\d+/ }
  its(:content) { should match /port = 4242/ }
  its(:content) { should match /timeout = 15/ }
  its(:content) { should match /user = user@example.com/ }
  its(:content) { should match /apikey = abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz01/ }
  its(:content) { should match /apikey = abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz01/ }
  its(:content) { should match /timeout = 15/ }
  its(:content) { should match /batch = 1/ }
  its(:content) { should match /url = http:\/\/localhost:8888\// }
  its(:content) { should match /batch = 100/ }
  its(:content) { should match /[collectors]/ }
  its(:content) { should match /[[default]]/ }
  its(:content) { should match /[loggers]/ }
  its(:content) { should match /keys = root/ }
  its(:content) { should match /keys = default/ }
  its(:content) { should match /level = INFO/ }
  its(:content) { should match /handlers = rotated_file/ }
  its(:content) { should match /propagate = 1/ }
  its(:content) { should match /class = handlers.TimedRotatingFileHandler/ }
  its(:content) { should match /level = DEBUG/ }
  its(:content) { should match /formatter = default/ }
  its(:content) { should match /args = \('\/var\/log\/diamond\/diamond.log', 'midnight', 1, 7\)/ }
  its(:content) { should match /format = (.)%\(asctime\)s(.) (.)%\(threadName\)s(.) %\(message\)s/ }
  its(:content) { should match /datefmt =\s+/ }
end