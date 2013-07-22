#
# Cookbook Name:: unicorn-nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory "/etc/nginx/sites-enabled" do
  owner "root"
  group "root"
  mode 0644
  action :create
end

directory "/etc/nginx/sites-available" do
  owner "root"
  group "root"
  mode 0644
  action :create
end


template "/etc/nginx/sites-available/rails" do
  source "sites-enabled.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

file "/etc/nginx/sites-enabled/000-default" do
  action :delete
end

link "/etc/nginx/sites-enabled/default" do
  to "/etc/nginx/sites-available/rails"
  link_type :symbolic
  action :create
end

service "nginx" do
  action :reload
end
