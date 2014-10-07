require 'spec_helper'
require 'rspec/its'

describe file('/etc/redis/redis.conf') do
  its(:content) { should match /daemonize yes/ }
  its(:content) { should match /pidfile \/var\/run\/redis\/redis-server.pid/ }
  its(:content) { should match /port 6379/ }
  its(:content) { should match /bind 0.0.0.0/ }
  its(:content) { should match /timeout 0/ }
  its(:content) { should match /tcp-keepalive 0/ }
  its(:content) { should match /loglevel notice/ }
  its(:content) { should match /logfile \/var\/log\/redis\/redis-server.log/ }
  its(:content) { should match /databases 16/ }
  its(:content) { should match /save 900 1/ }
  its(:content) { should match /save 300 10/ }
  its(:content) { should match /save 60 10000/ }
  its(:content) { should match /stop-writes-on-bgsave-error yes/ }
  its(:content) { should match /rdbcompression yes/ }
  its(:content) { should match /rdbchecksum yes/ }
  its(:content) { should match /dbfilename dump.rdb/ }
  its(:content) { should match /dir \/var\/lib\/redis/ }
  its(:content) { should match /slave-serve-stale-data yes/ }
  its(:content) { should match /slave-read-only yes/ }
  its(:content) { should match /repl-disable-tcp-nodelay no/ }
  its(:content) { should match /slave-priority 100/ }
  its(:content) { should match /requirepass (.*?)/ }
  its(:content) { should match /appendonly no/ }
  its(:content) { should match /appendfilename "appendonly.aof"/ }
  its(:content) { should match /appendfsync everysec/ }
  its(:content) { should match /no-appendfsync-on-rewrite no/ }
  its(:content) { should match /auto-aof-rewrite-percentage 100/ }
  its(:content) { should match /auto-aof-rewrite-min-size 64mb/ }
  its(:content) { should match /lua-time-limit 5000/ }
  its(:content) { should match /slowlog-log-slower-than 10000/ }
  its(:content) { should match /slowlog-max-len 128/ }
  its(:content) { should match /notify-keyspace-events ""/ }
  its(:content) { should match /hash-max-ziplist-entries 512/ }
  its(:content) { should match /hash-max-ziplist-value 64/ }
  its(:content) { should match /list-max-ziplist-entries 512/ }
  its(:content) { should match /list-max-ziplist-value 64/ }
  its(:content) { should match /set-max-intset-entries 512/ }
  its(:content) { should match /zset-max-ziplist-entries 128/ }
  its(:content) { should match /zset-max-ziplist-value 64/ }
  its(:content) { should match /activerehashing yes/ }
  its(:content) { should match /client-output-buffer-limit normal 0 0 0/ }
  its(:content) { should match /client-output-buffer-limit slave 256mb 64mb 60/ }
  its(:content) { should match /client-output-buffer-limit pubsub 32mb 8mb 60/ }
  its(:content) { should match /hz 10/ }
  its(:content) { should match /aof-rewrite-incremental-fsync yes/ }
end
