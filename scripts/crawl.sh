#!/bin/sh

# Establish basic configuration.
NC_ROOT_PATH=/app/norconex/norconex-collector-http-2.8.1
NC_LIB_PATH=$NC_ROOT_PATH/lib
NC_CLS_PATH=$NC_ROOT_PATH/classes
NC_LOG_PATH=$NC_ROOT_PATH/log4j.properties

# Pull in our parameter and provide a sanity check.
if [ -z "$1" ]; then
  echo "Site ID not provided."
  exit 1
else
  SITE_ID=$1
fi

# Set up the Norconex function.
run_norconex() {
  # echo "Run Norconex with ${1} started."
  java -Dlog4j.configuration="file:${NC_LOG_PATH}" -Dfile.encoding=UTF8 -cp "${NC_LIB_PATH}/*:${NC_CLS_PATH}" com.norconex.collector.http.HttpCollector -a start -c "${NC_ROOT_PATH}/${1}"
}

# Execute.
SITE_NAME="/app/config/$SITE_ID/$SITE_ID.xml"
run_norconex $SITE_NAME

exit 0
