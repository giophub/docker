#!/bin/sh

# docker run -d --name wlsadmin --hostname wlsadmin -p 7001:7001 --env-file ./container-scripts/domain.properties -e ADMIN_PASSWORD=weblogic01 -v /dvol:/u01/oracle/user_projects custom_domain

# docker run -d --name wl-gp-generic --hostname wlsadmin -p 7001:7001 --env-file ./container-scripts/domain.properties -e ADMIN_PASSWORD=weblogic01 -v /dvol/oracle/weblogic:/u01/oracle/user_projects weblogic-gp-generic:12.1.3
docker run -d --name wl-gp-generic --hostname wlsadmin -p 7001:7001 -p 7002:7002 --env-file ./container-scripts/domain.properties -e DOMAIN_NAME=ssl_domain -e ADMIN_PASSWORD=weblogic01 -v /dvol/oracle/weblogic:/u01/oracle/user_projects weblogic-gp-generic:12.1.3