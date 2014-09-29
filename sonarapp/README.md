sonarapp Cookbook
===============
Sets up a working instance of SonarQube, with postgres db as backend.

Intended to be started up with vagrant (using the Varantfile included). When started up like that you can 
use this appliance together with sonar-runner, with following settings in the sonar-runner.properties:

<pre>
#----- Default SonarQube server
sonar.host.url=http://192.168.101.102:9000/sonar/

#----- PostgreSQL
sonar.jdbc.url=jdbc:postgresql://192.168.101.102:5432/sonar

#----- Global database settings
sonar.jdbc.username=sonar
sonar.jdbc.password=sonar

#----- Default source code encoding
sonar.sourceEncoding=UTF-8

#----- Security (when 'sonar.forceAuthentication' is set to 'true')
sonar.login=admin
sonar.password=admin
</pre>


Requirements
------------
postgresql, database, java, sonar


License and Authors
-------------------
MIT Licence

Authors: Antti Koivisto