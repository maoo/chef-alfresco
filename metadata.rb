name             "alfresco"
maintainer       "Maurizio Pillitu"
maintainer_email ""
license          "Apache 2.0"
description      "Installs Alfresco Community and Enterprise Edition."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.5.0"

# Resolved by Berkshelf, not present in Supermarket or forked
depends "file"
depends "tomcat", '~> 0.17.3'
depends "maven", '~> 1.2.0'

# Community cookbooks
depends "artifact-deployer", "~> 0.8.9"
depends 'build-essential', '~> 2.2.3'
depends "database", "~> 4.0.5"
depends "ffmpeg", "~> 0.4.4"
depends "haproxy", "~> 1.6.6"
depends "imagemagick", "~> 0.2.3"
depends "java", "~> 1.31.0"
depends "libreoffice", "~> 0.0.2"
depends "mysql", "~> 6.0.21"
depends 'mysql2_chef_gem', "~> 1.0.1"
depends "nginx", "~> 2.7.6"
depends 'rsyslog', "~> 1.15.0"
depends "swftools", "~> 0.2.4"
depends 'yum-epel', '~> 0.6.0'
