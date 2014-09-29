name             'sonarapp'
maintainer       'Antti Koivisto'
maintainer_email 'kogitant@koant.com'
license          'MIT'
description      'Installs/Configures SonarQube'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 	"apt"  
depends 	"postgres"  
depends 	"database"
depends 	"java"
depends 	"chef-sonar"
