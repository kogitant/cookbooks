name             'pgbadgering'
maintainer       'Antti Koivisto'
maintainer_email 'chef@koant.com'
license          'Apache 2.0'
description      'Installs Postgres and latest pgBadger'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 	"apt"  
depends 	"postgres"  
depends 	"database"
depends 	"chef-pgbadger-latest"
