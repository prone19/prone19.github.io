# JMeter

[Back to HOME](https://prone19.github.io/)


### DSL Jmeter
https://habr.com/ru/company/otus/blog/653823/

### Groovy
```groovy
// get int, compute, convert to string
import org.apache.commons.math3.util.Precision

def projects_count = vars.get("projects_count") as int
page_count = projects_count / 20

//page_count = Math.round(page_count * 100) / 100
page_count = page_count.round(0)

vars.put("page_count", page_count.toString())
```