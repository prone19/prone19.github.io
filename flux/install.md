# FLUX and Grafana installation guide

[Back to HOME](https://prone19.github.io/)

## Flux
1. port 8086 opened in security group (AWS)
2. installing influxDB 2.2
```bash
wget -qO- https://repos.influxdata.com/influxdb.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdb.gpg > /dev/null
export DISTRIB_ID=$(lsb_release -si); export DISTRIB_CODENAME=$(lsb_release -sc)
echo "deb [signed-by=/etc/apt/trusted.gpg.d/influxdb.gpg] https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list > /dev/null

sudo apt-get update && sudo apt-get install influxdb2
```
3. Run the service
```bash
sudo service influxdb start
```
Installing the InfluxDB package creates a service file at /lib/systemd/services/influxdb.service to start InfluxDB as a background service on startup.
4. Check if it's running
```bash
sudo service influxdb status
```
5. Now it can be reached by instance-IP-address:8086
6. Set up the user as shown below
7. Now go to Data -> API Tokens -> either create a new one or save to clipboard the "admin's Token". It will be needed later on in Jmeter Backend listener and Grafana.
So far you're all set in FLUX regards.

## Grafana
1. Installing Grafana 7.3.7 **(tested on 7.3.7 version. The other versions may not operate properly and may be needed adjustments)**
```bash
sudo apt-get install -y adduser libfontconfig1
sudo wget https://dl.grafana.com/oss/release/grafana_7.3.7_amd64.deb
sudo dpkg -i grafana_7.3.7_amd64.deb
```
2. Setting to run at the system start
```bash
sudo systemctl enable --now grafana-server
```
3. Check status
```bash
sudo systemctl status grafana-server
```
4. It's now accesible by instance-IP-address:3000 (enter admin/admin, it will propose to reset the password)
5. Go to Settings and click "Add data source"
6. Choose InfluxDB and select the following parameters (paste the token to the Password field from the 6th step from above FLUX instruction)
7. Click Save & Test - at least 2 system buckets should appear
8. Import the following dashboards (or use your own)  
[Test Metrics.json](./Test%20Metrics.json)  
[Test Trends.json](./Tests%20Trends.json)  
*note*: test metrics dashboard is used for general puproses. Trends are used if you need to compare runs. But please be aware for them to be operative you need to use the following backed-listener values and tags. See below.

## Jmeter backend-listener configuration
You can use the default listener  

|parameter|value|
|---|---|
|influxdbMetricsSender|org.apache.jmeter.visualizers.backend.influxdb.HttpMetricsSender|
|influxdbUrl|http://<IP>:8086/api/v2/write?org=<ORG_name>&bucket=<BUCKET_name>|
|application|application|
|measurement|jmeter|
|summaryOnly|false|
|samplersRegex|.*|
|percentiles|99;95;90|
|testTitle|testTitle|
|eventTags||
|TAG_testRun|\${__groovy(def Tag1 = '\${__dateTimeConvert(${__P(TESTSTART.MS)},,yyyy-MM-dd'T'HH:mm:ss'Z',)}'.toString(); return Tag1;)}|
|influxdbToken|<influxDB_token>|
|TAG_testType|<TEST_type> it can be stress, load, stability and etc.|