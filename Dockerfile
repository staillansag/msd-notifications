FROM staillansag/webmethods-microservicesruntime:10.15.7-msdemo

EXPOSE 5555
EXPOSE 5543
EXPOSE 9999

USER sagadmin

ADD --chown=sagadmin . /opt/softwareag/IntegrationServer/packages/msd-notifications

# Make authorizations compliant with OpenShift
USER root
RUN chgrp -R 0 /opt/softwareag/IntegrationServer/packages && chmod -R g=u /opt/softwareag/IntegrationServer/packages
USER sagadmin