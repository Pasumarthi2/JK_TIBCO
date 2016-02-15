#
# Cookbook Name:: createdomain-dbems
# Recipe:: installemsclient
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# This recipe is temporarily kept here. This should be deleted once a seperate Cookbook for installing ems client jar files have been created.
# The JARs can be kept in S3 and downloaded from there

# Variables
tibco_instance_dir = node['createdomain-dbems']['config']['tibco_instance_dir']
tra_version = node['createdomain-dbems']['config']['tra_version']
tra_home_dir = "#{tibco_instance_dir}/tra/#{tra_version}"
tra_lib = "#{tra_home_dir}/lib"
config_user = node['createdomain-dbems']['config']['user']
config_group = node['createdomain-dbems']['config']['group']

# Install the various JMS client libraries to the target server tra lib direcrory from the cookbook files.
cookbook_file 'jms.jar' do
  source 'jms-2.0.jar'
  owner config_user
  group config_group
  mode '0755'
  path "#{tra_lib}/jms-2.0.jar"
end

cookbook_file 'tibcrypt.jar' do
  source 'tibcrypt.jar'
  owner config_user
  group config_group
  mode '0755'
  path "#{tra_lib}/tibcrypt.jar"
end

cookbook_file 'tibemsd_sec.jar' do
  source 'tibemsd_sec.jar'
  owner config_user
  group config_group
  mode '0755'
  path "#{tra_lib}/tibemsd_sec.jar"
end

cookbook_file 'tibjms.jar' do
  source 'tibjms.jar'
  owner config_user
  group config_group
  mode '0755'
  path "#{tra_lib}/tibjms.jar"
end

cookbook_file 'tibjmsadmin.jar' do
  source 'tibjmsadmin.jar'
  owner config_user
  group config_group
  mode '0755'
  path "#{tra_lib}/tibjmsadmin.jar"
end

cookbook_file 'tibjmsapps.jar' do
  source 'tibjmsapps.jar'
  owner config_user
  group config_group
  mode '0755'
  path "#{tra_lib}/tibjmsapps.jar"
end

cookbook_file 'tibjmsufo.jar' do
  source 'tibjmsufo.jar'
  owner config_user
  group config_group
  mode '0755'
  path "#{tra_lib}/tibjmsufo.jar"
end

cookbook_file 'tibrvjms.jar' do
  source 'tibrvjms.jar'
  owner config_user
  group config_group
  mode '0755'
  path "#{tra_lib}/tibrvjms.jar"
end
