# AWS filters cloudwatch

[Back to HOME](https://prone19.github.io/)
[Back to AWS](aws)

```
# find any log like kube view
fields @timestamp, kubernetes.pod_name, log
| filter kubernetes.namespace_name="" and log like /ms 500 /
| sort @timestamp asc
| limit 250

# number of requests by responce codes
filter log like /\d*.\d*.\d*.\d* - - \[.*\] ".* HTTP\/1.1"/
| parse log '* - - [*] "*" * ' as ip, _timestamp, request, response_code
| stats count(*) by response_code

# the same as above but stats for a certain IP
filter log like /\d*.\d*.\d*.\d* - - \[.*\] ".* HTTP\/1.1"/
| parse log '* - - [*] "*" * ' as ip, _timestamp, request, response_code
| filter ip = ""
| stats count(*) by response_code

# show requests with a certain response code
filter log like /\d*.\d*.\d*.\d* - - \[.*\] ".* HTTP\/1.1"/
| parse log '* - - [*] "*" * ' as ip, _timestamp, request, response_code
| filter response_code = "401"


----- users' requests -----

fields @timestamp, kubernetes.pod_name, log
| filter kubernetes.namespace_name="" and log like /\/v1\//
| parse log /HTTP.*?v1\/(?<type>.*?)\/(?<entity>.*?)(\/(?<optional>.*?))?\?(?<query>.*)/ 
| sort @timestamp desc
| limit 50

----- dist across entities CAPI -----

fields log
| filter kubernetes.namespace_name="" and log like /Request starting.*?\/v1\//
| parse log /HTTP.*?v1\/(?<type>\w*?)\/(?<entity>\w*?)(\/(?<optional1>\w*?))?(\/(?<optional2>\w*))?(?=$| |\/w*?\/|(?<query>\?\w*=.*? ))/
| stats count(*) as num by type, entity, optional1, optional2
| sort by num desc 
| filter num > 500000
| limit 250

fields log
| filter kubernetes.namespace_name="" and log like /Request starting.*?\/v1\/.*?search\/trial\?/
| parse log /HTTP.*?v1\/(?<type>\w*?)\/(?<entity>\w*?)\?(?<queryId>\w*)?=/
| stats count(*) as num by type, entity, queryId
| sort by num desc 
| filter num > 0
| limit 250

fields log
| filter kubernetes.namespace_name="" and log like /Request starting.*?\/v1\//
| parse log /HTTP.*?v1\/(?<type>\w*?)\/(?<entity>\w*?)(\/(?<optional1>\w*?))?(\/(?<optional2>\w*))?(?=$| |\/w*?\/|(?<query>\?\w*=))/
| stats count(*) as num by type, entity, optional1, optional2, query
| sort by num desc 
| filter num > 50000
| limit 250
```