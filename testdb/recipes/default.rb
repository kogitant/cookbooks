#
# Cookbook Name:: testdb
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "postgresql::server"
include_recipe "database::postgresql"

postgresql_connection_info = {:host => "localhost",
                              :port => node['postgresql']['config']['port'],
                              :username => 'postgres',
                              :password => node['postgresql']['password']['postgres']}
                              
# Create role test, with password test and create db test owned by role test
postgresql_database_user 'test' do
  connection postgresql_connection_info
  password 'test'
  action :create
end                 
postgresql_database 'test' do
  connection postgresql_connection_info
  owner 'test'
  action :create
end