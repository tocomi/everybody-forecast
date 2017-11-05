
working_directory '/var/www/everybody-forecast'

pid '/var/www/everybody-forecast/pids/unicorn.pid'

stdout_path '/var/www/everybody-forecast/log/unicorn.log'
stderr_path '/var/www/everybody-forecast/log/unicorn_err.log'

listen '/tmp/unicorn.everybody-forecast.sock'

worker_processes 2

timeout 30
