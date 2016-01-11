default['rv-install']['install']['group'] = 'tibeai'
default['rv-install']['install']['user'] = 'tibeai'
default['rv-install']['config']['group'] = 'sgsup'
default['rv-install']['config']['user'] = 'esbuser'

default['rv-install']['install']['tibco_home_name'] = 'TIBCO_EAI_HOME'
default['rv-install']['install']['tibco_home_dir'] = '/apps/tibco'
default['rv-install']['install']['logs_home_dir'] = '/logs/tibco'
default['rv-install']['install']['tibco_install_dir'] = '/apps/tibco/eai'
default['rv-install']['install']['tibco_instance_dir'] = '/apps/tibco/domain'
default['rv-install']['install']['logs_instance_dir'] = '/logs/tibco/domain'

default['rv-install']['install']['rv_bin_source'] = 'https://s3-us-west-2.amazonaws.com/rv-8.4.4-bin/linux/TIB_rv_8.4.4_linux_x86.zip'
default['rv-install']['install']['rv_bin_target_path'] = '/tmp/rv'
default['rv-install']['install']['rv_bin_zip'] = 'TIB_rv_8.4.4_linux_x86.zip'
default['rv-install']['install']['tibco_universalinstaller_bin'] = 'TIBCOUniversalInstaller-lnx-x86.bin'
default['rv-install']['install']['response_file'] = 'rvInstallResponseFile.silent'
default['rv-install']['install']['rv_home_dir'] = '/apps/tibco/eai/tibrv/8.4'

default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['java_home'] = '/opt/jre'
default['java']['set_etc_environment'] = 'true'
default['java']['oracle']['accept_oracle_download_terms'] = 'true'
