# ES-Demo
## Elasticsearch, Kibana, Norxonex and Lando demo

This repo is intended to provide a demonstration of an Elasticsearch setup with Lando using norconex for crawling multiple sites.

### Services

#### Appserver

Appserver provides a container to run the Norconex components for crawling remote sites. Additionally, in includes a JEF monitor that can be accessed via http://localhost:8080. The configuration for this application can be modified at config/jefconfig.xml.

This service also installs PHP to enable additional scripting and provide an easy Docker endpoint.

#### Elasticsearch 

This service contains the main ES service. This can be additionally configured via config/elasticsearch.yml but is generally hands-off.

#### Kibana

The Kibana service provides a GUI for interacting with ES via the Kibana application at http://localhost:5601.
