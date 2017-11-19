# Cookbook Name:: tocomi_cookbook
# Recipe:: ops_user

user 'ops' do
  action :create
  supports :manage_home => true
  home "/home/ops"
  shell "/bin/bash"
end
