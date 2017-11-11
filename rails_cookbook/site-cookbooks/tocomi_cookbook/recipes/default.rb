#
# Cookbook Name:: tocomi_cookbook
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'tocomi_cookbook::ops_user'
include_recipe 'tocomi_cookbook::keys'
include_recipe 'tocomi_cookbook::nginx_setting'
include_recipe 'tocomi_cookbook::iptables'
