#
# Cookbook Name:: sonarapp
# Recipe:: locales
#
# Copyright 2014, Antti Koivisto
#
unless  ENV["LANGUAGE"] == "fi_FI.UTF-8" &&
        ENV["LANG"] == "fi_FI.UTF-8" &&
        ENV["LC_ALL"] == "fi_FI.UTF-8"

  template "/etc/profile.d/lang.sh" do
    source  "lang.sh.erb"
    mode "0644"
  end

  execute "locale-gen" do
    command "locale-gen fi_FI.UTF-8"
  end

  execute "dpkg-reconfigure-locales" do
    command "dpkg-reconfigure locales"
  end


  template "/etc/default/locale" do
    source  "locale.erb"
    mode "0644"
  end

end