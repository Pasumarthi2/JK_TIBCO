#
# Cookbook Name:: createdomain
# Recipe:: domainutility
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Run the domainutility to create domain
#

config_user = node['createdomain-rv']['config']['user']
config_group = node['createdomain-rv']['config']['group']

tibco_instance_dir = node['createdomain-rv']['config']['tibco_instance_dir']
tra_version = node['createdomain-rv']['config']['tra_version']
tra_home_dir = "#{tibco_instance_dir}/tra/#{tra_version}"
tra_bin = "#{tra_home_dir}/bin"
createdomain_cmdfile = node['createdomain-rv']['config']['createdomain_cmdfile']

domain_name = node['createdomain-rv']['config']['domain_name']
tibcoadmin_domainhome_dir = "#{tibco_instance_dir}/administrator/domain"
tra_domainhome_dir = "#{tibco_instance_dir}/tra/domain"
tra_domain_dir = "#{tra_domainhome_dir}/#{domain_name}"
hawkagent = "#{tra_domain_dir}/hawkagent_#{domain_name}"
tibcoadmin_bin_dir = "#{tibcoadmin_domainhome_dir}/#{domain_name}/bin"
administrator = "#{tibcoadmin_bin_dir}/tibcoadmin_#{domain_name}"

# Install the required yum packages for running 32 bit domainutility on a 64 bit OS arch
case node['platform']
when 'redhat', 'centos', 'ubuntu'
  yum_package 'glibc.i686'
  yum_package 'libstdc++.i686'
when 'amazon'
  yum_package 'glibc.i686'
  yum_package 'libstdc++48.i686'
end

# Execute the domain utility
execute 'create_domain' do
  command "./domainutilitycmd -cmdFile #{createdomain_cmdfile}"
  cwd tra_bin
  user config_user
  group config_group
  not_if { File.exist? "#{hawkagent}" }
end

# Start the hawkagent
execute 'start_hawkagent' do
  command "nohup #{hawkagent} 2>&1 &"
  cwd tra_domain_dir
  user config_user
  group config_group
end

# Start the admin domain
execute 'start_admin' do
  command "nohup #{administrator} 2>&1 &"
  cwd tibcoadmin_bin_dir
  user config_user
  group config_group
end
