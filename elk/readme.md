# ELK Notes

1. Copy Elastic cert
docker cp elasticsearch:/usr/share/elasticsearch/config/certs/http_ca.crt .

2. Register cert
curl --cacert http_ca.crt -u elastic:elastic https://localhost:9200

3. Generate token for Kibana
docker exec -it elasticsearch /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana

4. Open Kibana logs and copy the url with the code
