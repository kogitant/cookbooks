#
# Cookbook Name:: sonarapp
# Recipe:: default
#
# Copyright 2014, Antti Koivisto
#
include_recipe "apt"
include_recipe "sonarapp::locales"

ENV["LANGUAGE"] = ENV["LANG"] = ENV["LC_ALL"] = "fi_FI.UTF-8"

include_recipe "postgresql::server"
include_recipe "database::postgresql"
include_recipe "java"
include_recipe "chef-sonar::database_postgresql"
include_recipe "chef-sonar::default"
	
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