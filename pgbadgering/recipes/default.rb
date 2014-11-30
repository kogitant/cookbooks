#
# Cookbook Name:: pgbadgering
# Recipe:: default
#
# Copyright 2014, Antti Koivisto
#
include_recipe "apt"
include_recipe "pgbadgering::locales"

ENV["LANGUAGE"] = ENV["LANG"] = ENV["LC_ALL"] = "fi_FI.UTF-8"

include_recipe "postgresql::server"
include_recipe "database::postgresql"
include_recipe "chef-pgbadger-latest::default"
include_recipe "apache2"
include_recipe "cron"
	
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
  encoding 'UTF-8'
  action :create
end


apt_package "screen" do
    action :install
end

apache_site 'default' do
  enable true
end

cron "pgbadger" do
  minute '*/5'
  command "/opt/pgbadger/pgbadger /var/log/postgresql/postgresql-9.1-main.log -O /var/www -o pgbadger.html"
end
