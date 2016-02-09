name 'bwpluginrestjson-install'
maintainer 'JitheshKumar (JK)'
maintainer_email 'jiteshkumar.thekkeveettil@citi.com'
license 'all_rights'
description 'Installs the TIBCO BW plugin for REST JSON'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.1'

depends 'java', '~> 1.36.0'
depends 'rv-install'
depends 'tra-install'
depends 'bw-install'
