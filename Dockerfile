
ARG IMAGE_ARG_ES_IMAGE_NAME
ARG IMAGE_ARG_ES_IMAGE_VERSION

FROM docker.elastic.co/elasticsearch/${IMAGE_ARG_ES_IMAGE_NAME:-elasticsearch}:${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10} as base

FROM scratch

COPY --from=base / /

# see: https://bitbucket.org/eunjeon/seunjeon/raw/master/elasticsearch/scripts/downloader.sh
#/usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://oss.sonatype.org/service/local/repositories/releases/content/org/bitbucket/eunjeon/elasticsearch-analysis-seunjeon/6.1.1.1/elasticsearch-analysis-seunjeon-6.1.1.1.zip

# can not find elasticsearch-jetty-2.2.0 on the Internet
#elasticsearch-jetty-2.2.0

# come with docker image
#/usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/ingest-geoip/ingest-geoip-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip
# come with docker image
#/usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/ingest-user-agent/ingest-user-agent-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip
RUN set -ex \
  && /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-icu/analysis-icu-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip \
  && /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-kuromoji/analysis-kuromoji-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip \
  && /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-phonetic/analysis-phonetic-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip \
  && /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-smartcn/analysis-smartcn-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip \
  && /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-stempel/analysis-stempel-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip \
  && /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-ukrainian/analysis-ukrainian-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip \
  && /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/discovery-ec2/discovery-ec2-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip \
  && /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/ingest-attachment/ingest-attachment-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip \
  && /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/mapper-murmur3/mapper-murmur3-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip \
  && /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/mapper-size/mapper-size-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip \
  && /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://artifacts.elastic.co/downloads/elasticsearch-plugins/repository-s3/repository-s3-${IMAGE_ARG_ES_IMAGE_VERSION:-5.6.10}.zip
