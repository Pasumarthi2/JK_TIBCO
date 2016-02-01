#
# Cookbook Name:: createdomain-dbems
# Recipe:: commandfilexml
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Generate the CreateDomain.xml from the template

# Initialize the variables
createdomain_cmdfile = node['createdomain-dbems']['config']['createdomain_cmdfile']

db_use_tns = node['createdomain-dbems']['config']['db_use_tns']
db_driver = node['createdomain-dbems']['config']['db_driver']

db_tnsname = node['createdomain-dbems']['config']['db_tnsname']
db_tnsfile = node['createdomain-dbems']['config']['db_tnsfile']
db_hostname = node['createdomain-dbems']['config']['db_hostname']
db_port = node['createdomain-dbems']['config']['db_port']
db_sid = node['createdomain-dbems']['config']['db_sid']

# Form the DB url based on the usage of TNS and the selected driver
if "#{db_use_tns}" == 'true'
  case db_driver
  when 'oracle.jdbc.driver.OracleDriver'
    db_connection_url = "jdbc:oracle:thin:@(TNSNamesFile=#{db_tnsfile};TNSServerName=#{db_tnsname})"
  when 'tibcosoftwareinc.jdbc.oracle.OracleDriver'
    db_connection_url = "jdbc:tibcosoftwareinc:oracle:TNSNamesFile=#{db_tnsfile};TNSServerName=#{db_tnsname}"
  end
else
  case db_driver
  when 'oracle.jdbc.driver.OracleDriver'
    db_connection_url = "jdbc:oracle:thin:@#{db_hostname}:#{db_port}:#{db_sid}"
  when 'tibcosoftwareinc.jdbc.oracle.OracleDriver'
    db_connection_url = "jdbc:tibcosoftwareinc:oracle://#{db_hostname}:#{db_port};SID=#{db_sid}"
  end
end

# Generate the CreateDomain commandfile XML from the template and based on the DB url
template 'CreateDomain.xml' do
  source 'CreateDomain.xml.erb'
  mode '0755'
  path createdomain_cmdfile
  variables(DatabaseUrl: db_connection_url)
end
