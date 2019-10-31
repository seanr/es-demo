#!/bin/bash

# Blow away existing stack - this will only happen on rebuild.
rm -rf /app/norconex/

# Ensure presence of log file.
touch /var/log/search/worker.log

# Move to Norconex directory.
mkdir -p /app/norconex/
cd /app/norconex/

# Add Norconex components.
wget -NS --content-disposition 'https://oss.sonatype.org/content/repositories/releases/com/norconex/collectors/norconex-collector-http/2.8.1/norconex-collector-http-2.8.1.zip'
unzip -o norconex-collector-http-2.8.1.zip; rm norconex-collector-http-2.8.1.zip

wget -NS --content-disposition 'https://oss.sonatype.org/content/repositories/releases/com/norconex/collectors/norconex-committer-elasticsearch/4.1.0/norconex-committer-elasticsearch-4.1.0.zip'
unzip -o norconex-committer-elasticsearch-4.1.0.zip; rm norconex-committer-elasticsearch-4.1.0.zip

wget -NS --content-disposition 'https://oss.sonatype.org/content/repositories/releases/com/norconex/jef/norconex-jef-monitor/4.0.5/norconex-jef-monitor-4.0.5.zip'
unzip -o norconex-jef-monitor-4.0.5.zip; rm norconex-jef-monitor-4.0.5.zip

# Copy Norconex config.
cp /app/config/jefconfig.xml /app/norconex/norconex-jef-monitor-4.0.5/config/jefconfig.xml
cp /app/config/setup.properties /app/norconex/norconex-jef-monitor-4.0.5/config/setup.properties

# Permissions for Norconex monitor and installer.
chmod a+x /app/norconex/norconex-jef-monitor-4.0.5/jef-monitor.sh
chmod a+x /app/norconex/norconex-committer-elasticsearch-4.1.0/install.sh

# Interactive responses for Norconex ES committer installer.
/app/scripts/norconex.expect
