# appInstallationDemo

This is simple application installation demo which installs Tomcat, mySQL and an webapplication.

You can just download this repository and do vagrant up 

```
vagrant up
```

It will perform the following.

·      Install Tomcat Server.
·      Configure Tomcat Server to start with http port as 80.
·      Install MySQL Database.
·      Reset MySQL root user password to welcome1 and run the provided Sql Script.
·      Deploy the given Application on tomcat.
·      Configure the application with database.
·      Start the server.


After the vagrant up command was sucessfull you should see the following 

```
==> default:  * Stopping Tomcat servlet engine tomcat7
==> default:    ...done.
==> default:  * Starting Tomcat servlet engine tomcat7
==> default:    ...done.
```

Verify if the application is running from your host machine. Not on vagrant machine.

```
http://localhost:9161/petclinic/
```
