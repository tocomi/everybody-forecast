# Cookbook Name:: tocomi_cookbook
# Recipe:: nginx_setting

directory '/var/www/everybody-forecast' do
  owner 'ops'
  action :create
  recursive true
end

template '/etc/nginx/sites-available/default' do
  action :create
  source "default.conf.erb"
  notifies :reload, 'service[nginx]'
end
