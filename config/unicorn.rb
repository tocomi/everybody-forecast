# -*- coding: utf-8 -*-

# setting port
listen "127.0.0.1:3000"

# setting pid file
pid './tmp/pids/unicorn.pid'

# setting worker
worker_processes 2

# setting timeout
timeout 15

# preload for remove downtime
preload_app true

# setting log path
ROOT = File.dirname(File.dirname(__FILE__))
stdout_path "#{ROOT}/log/unicorn-stdout.log"
stderr_path "#{ROOT}/log/unicorn_err.log"

# setting behaviour before or after fork
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
